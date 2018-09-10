tableextension 123456700 "CSD RessorceExt" extends Resource
{
    fields
    {
        field(123456701;"CSD Ressource Type";Option)
        
        {
            Caption = 'Ressource Type';
            OptionMembers = Internal,External;
        }
        field(123456702;"CSD Maximum Participants";Integer)
        {
            Caption = 'Maximum Participants';
        }
        field(123456703;"CSD Quantity Per Day";Decimal)
        {
            Caption = 'Quantity Per Day';
        }
        modify("Profit %")
       
        {
        trigger OnBeforeValidate();
        begin
            rec.TestField("Unit Cost");
        end;

        }
    }
    
   var
        myInt : Integer;
}