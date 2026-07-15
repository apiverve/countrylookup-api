declare module '@apiverve/countrylookup' {
  export interface countrylookupOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface countrylookupResponse {
    status: string;
    error: string | null;
    data: CountryLookupData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface CountryLookupData {
      search:    null | string;
      countries: Country[];
  }
  
  interface Country {
      name:         Name;
      tld:          (null | string)[];
      cca2:         null | string;
      ccn3:         null | string;
      cca3:         null | string;
      cioc:         null | string;
      independent:  boolean | null;
      status:       null | string;
      capital:      (null | string)[];
      altSpellings: (null | string)[];
      region:       null | string;
      subregion:    null | string;
      languages:    Languages;
      latlng:       (number | null)[];
      landlocked:   boolean | null;
      flag:         null | string;
  }
  
  interface Languages {
      eng: null | string;
  }
  
  interface Name {
      common:   null | string;
      official: null | string;
      native:   Native;
  }
  
  interface Native {
      eng: Eng;
  }
  
  interface Eng {
      official: null | string;
      common:   null | string;
  }

  export default class countrylookupWrapper {
    constructor(options: countrylookupOptions);

    execute(callback: (error: any, data: countrylookupResponse | null) => void): Promise<countrylookupResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: countrylookupResponse | null) => void): Promise<countrylookupResponse>;
    execute(query?: Record<string, any>): Promise<countrylookupResponse>;
  }
}
