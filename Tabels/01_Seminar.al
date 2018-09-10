table 123456701 "CSD Seminar"
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(10;"No.";Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
            trigger OnValidate();
            begin
                if "No." <> xRec."No." then begin 
                    SeminarSetup.GET; 
                    NoSeriesMgt.TestManual(SeminarSetup."Seminar Nos."); 
                    "No. Series" := ''; 
                end;
            end;    
        }
        field(20;Name;Text[50])
        {
            Caption = 'Name';
            DataClassification = ToBeClassified;
            trigger OnValidate();
            begin 
                if ("Search Name"=UpperCase(xRec.Name)) or ("Search Name"='') then 
                    "Search Name":=Name; 
            end;
        }
        field(30;"Seminar duration";Decimal)
        {
            Caption = 'Seminar duration';
            DecimalPlaces = 0:1;
            DataClassification = ToBeClassified;
        }
        field(40;"Minimum Participants";Integer)
        {
            Caption = 'Minimum Participants';
            DataClassification = ToBeClassified;
        }
        field(50;"Maximum Participants";Integer)
        {
            Caption = 'Maximum Participants';
            DataClassification = ToBeClassified;
        }
        field(60;"Search Name";Code[50])
        {
            Caption = 'Search Name';
            DataClassification = ToBeClassified;
        }
        field(70;Blocked;Boolean)
        {
            Caption = 'Blocked';
            DataClassification = ToBeClassified;
        }
        field(80;"Last Date Modified";date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(90;Comment;Boolean)
        {
            Caption = 'Comment';
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(100;"Seminar price";Decimal)
        {
            Caption = 'Comment';
            AutoFormatType = 1;
            DataClassification = ToBeClassified;
        }
        field(110;"Gen. Prod. Posting Group";Code[10])
        {
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group".Code;
            DataClassification = ToBeClassified;
            trigger OnValidate();
            begin 
                if (xRec."Gen. Prod. Posting Group"<> "Gen. Prod. Posting Group") then 
                begin 
                    if GenProdPostingGroup.ValidateVatProdPostingGroup (GenProdPostingGroup,"Gen. Prod. Posting Group") then Validate("VAT Prod. Posting Group", GenProdPostingGroup."Def. VAT Prod. Posting Group"); 
                 end; 
            end;
        }
        field(120;"VAT Prod. Posting Group";Code[10])
        {
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "VAT Product Posting Group".Code;
            DataClassification = ToBeClassified;
        }
        field(130;"No. Series";Code[10])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series".Code;
            Editable = false;
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK;"No.")
        {
            Clustered = true;
        }
        key(k2;"Search Name" )
        {
            
        }
    }
    
    var
        SeminarSetup : Record "CSD Seminar Setup"; 
        CommentLine : record "CSD Seminar Comment Line"; 
        Seminar : Record "CSD Seminar";
        GenProdPostingGroup: Record "Gen. Product Posting Group"; 
        NoSeriesMgt : Codeunit NoSeriesManagement;


    trigger OnInsert();
    begin
        if "No."='' then begin 
            SeminarSetup.get; 
            SeminarSetup.TestField("Seminar Nos."); 
            NoSeriesMgt.InitSeries(SeminarSetup."Seminar Nos.",xRec."No. Series",0D,"No.","No. Series"); 
        end;
    end;

    trigger OnModify();
    begin
        "Last Date Modified":=Today;
    end;

    trigger OnDelete();
    begin
        CommentLine.Reset; 
        CommentLine.SetRange("Table Name", 
        CommentLine."Table Name"::Seminar); 
        CommentLine.SetRange("No.","No."); 
        CommentLine.DeleteAll;
    end;

    trigger OnRename();
    begin
        "Last Date Modified":=Today;
    end;

}