using CatalogService as service from '../../srv/cat-service';

annotate service.POHeaders with  {
    partner @Common.ValueList: {
    CollectionPath : 'Partner',
    Parameters : [
      {$Type: 'Common.ValueListParameterInOut', LocalDataProperty: partner_ID, ValueListProperty: 'ID'},
      {$Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'name'},
      {$Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'city'},
    ]
  };  

};
