table 50102 "PTE Direct Print Log"
{
    fields
    {
        field(1; "Entry No."; Integer) { DataClassification = SystemMetadata; AutoIncrement = true; }
        field(2; "Report ID"; Integer) { DataClassification = SystemMetadata; }
        field(3; "Session Id"; Integer) { DataClassification = SystemMetadata; }
        field(4; View; Text[2048]) { DataClassification = SystemMetadata; }
        field(5; "Table ID"; Integer) { DataClassification = SystemMetadata; }
    }

    keys { key(pk; "Entry No.") { Clustered = true; } }

}
page 50102 "PTE Direct Print Log"
{
    Caption = 'Direct Print Log';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = History;
    SourceTable = "PTE Direct Print Log";

    layout
    {
        area(Content)
        {
            repeater(repeater)
            {
                field("Report ID"; Rec."Report ID") { ApplicationArea = All; }
                field("Session ID"; Rec."Session ID") { ApplicationArea = All; }
                field(View; Rec.View) { ApplicationArea = All; }
                field("Table ID"; Rec."Table ID") { ApplicationArea = All; }
            }
        }
    }
}