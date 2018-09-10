table 123456700 "CSD Seminar Setup"
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(10;"Primary Key";Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = ToBeClassified;
        }
        
        field(20;"Seminar Nos.";Code[20])
        {
            Caption = 'Seminar Nos.';
            TableRelation = "No. Series".Code;
            DataClassification = ToBeClassified;
        }
        field(30;"Seminar Registration Nos.";Code[20])
        {
            Caption = 'Seminar Registration Nos.';
            TableRelation = "No. Series".Code;
            DataClassification = ToBeClassified;
        }
        field(40;"Posted Seminar Reg. Nos.";Code[20])
        {
            Caption = 'Posted Seminar Reg. Nos.';
            TableRelation = "No. Series".Code;
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK;"Primary Key")
        {
            Clustered = true;
        }
    }
    
    var
        myInt : Integer;

    trigger OnInsert();
    begin
    end;

    trigger OnModify();
    begin
    end;

    trigger OnDelete();
    begin
    end;

    trigger OnRename();
    begin
    end;

}