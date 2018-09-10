page 123456700 AllObjects_ERPG
{
    PageType = List;
    SourceTable = AllObjWithCaption;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Object Type";"Object Type")
                {
                    
                }
                field("Object ID";"Object ID")
                {
                    
                }
                field("Object Caption";"Object Caption")
                {
                    
                }
            }
        }
        area(factboxes)
        {
        }
    }

    actions
    {
        area(processing)
        {
            action(ActionName)
            {
                trigger OnAction();
                begin
                end;
            }
        }
    }
}