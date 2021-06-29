# QBS.BusinessCentral.DirectPrint

With the introduction of the Web Client, printing has changed in Business Central as compared to Dynamics NAV. 

The reason for this is simple, from a web application there is no access to the windows platform you are running on.

As a result, you can print to a PDF, which will download, or you can print via the user interface of your browser.

In many larger implementations it is required to print without the user having to press half a dozen buttons.

The solution, if you are running On Prem, is to print via serverside sessions. This is what this little Per Tenant Extension does.

If you are running Cloud, you can use Cloud Printing or look at ISV solutions from QBS Partners such as www.fornav.com

## Setup

You can Direct Print any report that is printed via the Report Selections. Simply add the report to the Direct Print Setup table and it should work.

![setup](/img/Setup.png) 