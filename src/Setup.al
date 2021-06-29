table 50101 "PTE Direct Print Setup"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Report ID"; Integer) { DataClassification = SystemMetadata; }
        field(2; "User ID"; Code[50]) { DataClassification = EndUserIdentifiableInformation; }
    }

    keys { key(pk; "Report ID", "User ID") { Clustered = true; } }

}

page 50101 "PTE Direct Print Setup"
{
    Caption = 'Direct Print Setup';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "PTE Direct Print Setup";

    layout
    {
        area(Content)
        {
            repeater(repeater)
            {
                field("Report ID"; Rec."Report ID") { ApplicationArea = All; }
                field("User ID"; Rec."User ID") { ApplicationArea = All; }
            }
        }
    }
}