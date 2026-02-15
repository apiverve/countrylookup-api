// Package countrylookup provides a Go client for the Country Lookup API.
//
// For more information, visit: https://apiverve.com/marketplace/countrylookup?utm_source=go&utm_medium=readme
package countrylookup

import (
	"fmt"
	"reflect"
	"regexp"
	"strings"
)

// ValidationRule defines validation constraints for a parameter.
type ValidationRule struct {
	Type      string
	Required  bool
	Min       *float64
	Max       *float64
	MinLength *int
	MaxLength *int
	Format    string
	Enum      []string
}

// ValidationError represents a parameter validation error.
type ValidationError struct {
	Errors []string
}

func (e *ValidationError) Error() string {
	return "Validation failed: " + strings.Join(e.Errors, "; ")
}

// Helper functions for pointers
func float64Ptr(v float64) *float64 { return &v }
func intPtr(v int) *int             { return &v }

// Format validation patterns
var formatPatterns = map[string]*regexp.Regexp{
	"email":    regexp.MustCompile(`^[^\s@]+@[^\s@]+\.[^\s@]+$`),
	"url":      regexp.MustCompile(`^https?://.+`),
	"ip":       regexp.MustCompile(`^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$|^([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}$`),
	"date":     regexp.MustCompile(`^\d{4}-\d{2}-\d{2}$`),
	"hexColor": regexp.MustCompile(`^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$`),
}

// Request contains the parameters for the Country Lookup API.
//
// Parameters:
//   - country (required): string - The Country name or ISO code of the country for which you want to get the data (e.g., USA)
//   - majorcities: boolean - Specify if you would like to return all major cities of the country found
type Request struct {
	Country string `json:"country"` // Required
	Majorcities bool `json:"majorcities,omitempty"` // Optional
}

// ToQueryParams converts the request struct to a map of query parameters.
// Only non-zero values are included.
func (r *Request) ToQueryParams() map[string]string {
	params := make(map[string]string)
	if r == nil {
		return params
	}

	v := reflect.ValueOf(*r)
	t := v.Type()

	for i := 0; i < v.NumField(); i++ {
		field := v.Field(i)
		fieldType := t.Field(i)

		// Get the json tag for the field name
		jsonTag := fieldType.Tag.Get("json")
		if jsonTag == "" {
			continue
		}
		// Handle tags like `json:"name,omitempty"`
		jsonName := strings.Split(jsonTag, ",")[0]
		if jsonName == "-" {
			continue
		}

		// Skip zero values
		if field.IsZero() {
			continue
		}

		// Convert to string
		params[jsonName] = fmt.Sprintf("%v", field.Interface())
	}

	return params
}

// Validate checks the request parameters against validation rules.
// Returns a ValidationError if validation fails, nil otherwise.
func (r *Request) Validate() error {
	rules := map[string]ValidationRule{
		"country": {Type: "string", Required: true},
		"majorcities": {Type: "boolean", Required: false},
	}

	if len(rules) == 0 {
		return nil
	}

	var errors []string
	v := reflect.ValueOf(*r)
	t := v.Type()

	for i := 0; i < v.NumField(); i++ {
		field := v.Field(i)
		fieldType := t.Field(i)

		jsonTag := fieldType.Tag.Get("json")
		if jsonTag == "" {
			continue
		}
		jsonName := strings.Split(jsonTag, ",")[0]

		rule, exists := rules[jsonName]
		if !exists {
			continue
		}

		// Check required
		if rule.Required && field.IsZero() {
			errors = append(errors, fmt.Sprintf("Required parameter [%s] is missing", jsonName))
			continue
		}

		if field.IsZero() {
			continue
		}

		// Type-specific validation
		switch rule.Type {
		case "integer", "number":
			var numVal float64
			switch field.Kind() {
			case reflect.Int, reflect.Int64:
				numVal = float64(field.Int())
			case reflect.Float64:
				numVal = field.Float()
			}
			if rule.Min != nil && numVal < *rule.Min {
				errors = append(errors, fmt.Sprintf("Parameter [%s] must be at least %v", jsonName, *rule.Min))
			}
			if rule.Max != nil && numVal > *rule.Max {
				errors = append(errors, fmt.Sprintf("Parameter [%s] must be at most %v", jsonName, *rule.Max))
			}

		case "string":
			strVal := field.String()
			if rule.MinLength != nil && len(strVal) < *rule.MinLength {
				errors = append(errors, fmt.Sprintf("Parameter [%s] must be at least %d characters", jsonName, *rule.MinLength))
			}
			if rule.MaxLength != nil && len(strVal) > *rule.MaxLength {
				errors = append(errors, fmt.Sprintf("Parameter [%s] must be at most %d characters", jsonName, *rule.MaxLength))
			}
			if rule.Format != "" {
				if pattern, ok := formatPatterns[rule.Format]; ok {
					if !pattern.MatchString(strVal) {
						errors = append(errors, fmt.Sprintf("Parameter [%s] must be a valid %s", jsonName, rule.Format))
					}
				}
			}
		}

		// Enum validation
		if len(rule.Enum) > 0 {
			strVal := fmt.Sprintf("%v", field.Interface())
			found := false
			for _, enumVal := range rule.Enum {
				if strVal == enumVal {
					found = true
					break
				}
			}
			if !found {
				errors = append(errors, fmt.Sprintf("Parameter [%s] must be one of: %s", jsonName, strings.Join(rule.Enum, ", ")))
			}
		}
	}

	if len(errors) > 0 {
		return &ValidationError{Errors: errors}
	}
	return nil
}

// ResponseData contains the data returned by the Country Lookup API.
type ResponseData struct {
	Search string `json:"search"`
	Countries []CountriesItem `json:"countries"`
}

// CountriesItem represents an item in the Countries array.
type CountriesItem struct {
	Name NameData `json:"name"`
	Tld []string `json:"tld"`
	Cca2 string `json:"cca2"`
	Ccn3 string `json:"ccn3"`
	Cca3 string `json:"cca3"`
	Cioc string `json:"cioc"`
	Independent bool `json:"independent"`
	Status string `json:"status"`
	Currencies CurrenciesData `json:"currencies"`
	Capital []string `json:"capital"`
	AltSpellings []string `json:"altSpellings"`
	Region string `json:"region"`
	Subregion string `json:"subregion"`
	Languages LanguagesData `json:"languages"`
	Latlng []int `json:"latlng"`
	Landlocked bool `json:"landlocked"`
	Borders []string `json:"borders"`
	Area int `json:"area"`
	Flag string `json:"flag"`
	MajorCities []string `json:"majorCities"`
}

// NameData represents the name object.
type NameData struct {
	Common string `json:"common"`
	Official string `json:"official"`
	Native NativeData `json:"native"`
}

// NativeData represents the native object.
type NativeData struct {
	Eng EngData `json:"eng"`
}

// EngData represents the eng object.
type EngData struct {
	Official string `json:"official"`
	Common string `json:"common"`
}

// CurrenciesData represents the currencies object.
type CurrenciesData struct {
	USD USDData `json:"USD"`
}

// USDData represents the USD object.
type USDData struct {
	Name string `json:"name"`
	Symbol string `json:"symbol"`
}

// LanguagesData represents the languages object.
type LanguagesData struct {
	Eng string `json:"eng"`
}
