import type { Schema, Struct } from '@strapi/strapi';

export interface FooterContentTermsAndConditions
  extends Struct.ComponentSchema {
  collectionName: 'components_footer_content_terms_and_conditions';
  info: {
    displayName: 'terms and conditions';
    icon: 'chartCircle';
  };
  attributes: {
    HTML_CONTENT: Schema.Attribute.RichText;
  };
}

declare module '@strapi/strapi' {
  export module Public {
    export interface ComponentSchemas {
      'footer-content.terms-and-conditions': FooterContentTermsAndConditions;
    }
  }
}
