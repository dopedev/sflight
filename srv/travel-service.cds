using { sap.fe.cap.travel as my } from '../db/schema';

service TravelService @(path:'/processor') {
  type input :  {
    email: String(1024) @assert.format : '^[^@]+@[^@]+\.[^@]+$';
  }
  @(restrict: [
    { grant: 'READ', to: 'authenticated-user'},
    { grant: ['rejectTravel','acceptTravel','deductDiscount'], to: 'reviewer'},
    { grant: ['*'], to: 'processor'},
    { grant: ['*'], to: 'admin'}
  ])

  entity Travel as projection on my.Travel actions {
    action createTravelByTemplate() returns Travel;
    action rejectTravel();
    action acceptTravel();
    action deductDiscount( percent: Percentage not null ) returns Travel;
    action updateEmail(in:$self,
     @UI.ParameterDefaultValue: in.to_Customer.EMailAddress
     Email: input:email
    );
  };

}

type Percentage : Integer @assert.range: [1,100];
