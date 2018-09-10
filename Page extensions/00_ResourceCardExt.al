pageextension 123456700 "CSD ResourceCardExt" extends "Resource Card"
{
    layout
    {
        addlast(General)
        {
            field("CSD Ressource Type"; "CSD Ressource Type")
            {

            }
            field("CSD Quantity Per Day"; "CSD Quantity Per Day")
            {

            }
        }
        addlast(Content)
        {
            group(Room)
            {
                Visible = ShowMaxFields;

            }
        }
        addfirst(Room)
        {
            field("CSD Maximum Participants"; "CSD Maximum Participants")
            {

            }
        }
    }

    actions
    {

    }

    var
        myInt: Integer;

    trigger OnAfterGetRecord();
    begin
        ShowMaxFields := Type = Type::Machine;
        CurrPage.Update(false);
    end;

    var
        [InDataSet]
        ShowMaxFields: Boolean;
}
