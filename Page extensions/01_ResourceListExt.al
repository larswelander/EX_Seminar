pageextension 123456701 "CSD ResourceListExt" extends "Resource List"
{
    layout
    {
        addafter(Type)
        {
            field("CSD Ressource Type"; "CSD Ressource Type")
            {
                Visible = ShowMaxFields;

            }
            field("CSD Quantity Per Day"; "CSD Maximum Participants")
            {

            }
        }
        modify(Type)
        {
            Visible = ShowTypeField;
        }

    }

    actions
    {

    }

    var
        myInt: Integer;

    trigger OnOpenPage();
    begin
        FilterGroup(3);
        ShowMaxFields := GetFilter(Type) = FORMAT(Type::Machine);
        ShowTypeField := GetFilter(Type) = '';
        FilterGroup(0);
        
        
    end;

    var
        [InDataSet]
        ShowMaxFields: Boolean;
        ShowTypeField: Boolean;
}
