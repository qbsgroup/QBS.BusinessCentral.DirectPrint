table 50100 "PTE Direct Print"
{
    TableType = Temporary;

    fields
    {
        field(1; "Report ID"; Integer) { DataClassification = SystemMetadata; }
        field(2; "Session Id"; Integer) { DataClassification = SystemMetadata; }
        field(3; View; Text[2048]) { DataClassification = SystemMetadata; }
        field(4; "Table ID"; Integer) { DataClassification = SystemMetadata; }
    }

    keys { key(pk; "Report ID") { Clustered = true; } }

    procedure IsValid(): Boolean
    var
        Setup: Record "PTE Direct Print Setup";
    begin
        if "Report ID" = 0 then
            exit(false);

        if Setup.IsEmpty then
            exit(false);

        if not Setup.Get("Report ID", UserId) then
            if not Setup.Get("Report ID") then
                if not Setup.Get(0, UserId) then
                    exit(false);
        exit(true);
    end;

    procedure Print()
    var
        RecRef: RecordRef;
    begin
        RecRef.Open("Table ID");
        RecRef.SetView(View);
        Report.Print("Report ID", '', '', RecRef);
        CreateLog;
    end;

    local procedure CreateLog()
    var
        DirectPrintLog: Record "PTE Direct Print Log";
    begin
        DirectPrintLog.Init();
        DirectPrintLog."Entry No." := 0;
        DirectPrintLog."Report ID" := "Report ID";
        DirectPrintLog."Session Id" := "Session Id";
        DirectPrintLog."Table ID" := "Table ID";
        DirectPrintLog.View := View;
        DirectPrintLog.Insert();
    end;

    procedure SetRecordView(var Value: Variant)
    var
        RecRef: RecordRef;
    begin
        if not Value.IsRecordRef then
            exit;

        RecRef := Value;
        View := RecRef.GetView(false);
        "Table ID" := RecRef.Number;
    end;
}