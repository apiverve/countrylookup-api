using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.CountryLookup
{
    /// <summary>
    /// Query options for the Country Lookup API
    /// </summary>
    public class CountryLookupQueryOptions
    {
        /// <summary>
        /// The Country name or ISO code of the country for which you want to get the data (e.g., USA)
        /// </summary>
        [JsonProperty("country")]
        public string Country { get; set; }

        /// <summary>
        /// Specify if you would like to return all major cities of the country found
        /// </summary>
        [JsonProperty("majorcities")]
        public bool? Majorcities { get; set; }

        /// <summary>
        /// Set to true to add demonyms, land area in square kilometers, and UN membership to each country
        /// </summary>
        [JsonProperty("details")]
        public bool? Details { get; set; }
    }
}
