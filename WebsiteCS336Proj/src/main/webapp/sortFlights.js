// Define a function to sort the table by a specific column
function sortTable(columnIndex, dataType) {
    var table, rows, switching, i, x, y, shouldSwitch;
    table = document.getElementById("flightTable"); // Assuming your table has the id "flightTable"
    switching = true;

    // Set the sorting order to ascending by default
    var sortOrder = "asc";

    // Check if the column is already being sorted in ascending order
    if (table.getAttribute("data-sort-column") == columnIndex && table.getAttribute("data-sort-order") == "asc") {
        sortOrder = "desc";
    }

    // Update the sorting order attributes
    table.setAttribute("data-sort-column", columnIndex);
    table.setAttribute("data-sort-order", sortOrder);

    // Make a loop that will continue until no switching has been done
    while (switching) {
        switching = false;
        rows = table.rows;

        // Loop through all table rows (except the first, which contains table headers)
        for (i = 1; i < (rows.length - 1); i++) {
            shouldSwitch = false;

            // Get the two elements you want to compare, based on the column index
            x = rows[i].getElementsByTagName("td")[columnIndex];
            y = rows[i + 1].getElementsByTagName("td")[columnIndex];

            // Convert the data to the appropriate type for comparison
            if (dataType === "numeric") {
                x = parseFloat(x.innerHTML);
                y = parseFloat(y.innerHTML);
            } else if (dataType === "date") {
                x = new Date(x.innerHTML);
                y = new Date(y.innerHTML);
            }

            // Check if the two rows should switch places based on the sorting order
            if ((sortOrder === "asc" && x > y) || (sortOrder === "desc" && x < y)) {
                shouldSwitch = true;
                break;
            }
        }

        // If a switch has been marked, make the switch and mark that a switch has been done
        if (shouldSwitch) {
            rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
            switching = true;
        }
    }
}

$(document).ready(function () {
    // Function to handle filtering when the "Enter" button is clicked
    $("#filterButton").click(function () {
        // Get filter values from input fields
        var epriceFilter = $("#epriceFilter").val();
        var bpriceFilter = $("#bpriceFilter").val();
        var fpriceFilter = $("#fpriceFilter").val();
        var takeoffFilter = $("#takeoffFilter").val();
        var landingFilter = $("#landingFilter").val();
        var airlineFilter = $("#airlineFilter").val();

        // Perform filtering on the client side (you can also send these values to the server for server-side filtering)
        filterFlights(epriceFilter, bpriceFilter, fpriceFilter, takeoffFilter, landingFilter, airlineFilter);
    });

    // Function to filter flights based on criteria
    function filterFlights(epriceFilter, bpriceFilter, fpriceFilter, takeoffFilter, landingFilter, airlineFilter) {
        // Loop through each row in the table
        $("#flightTable tbody tr").each(function () {
            var row = $(this);

            // Get values from the current row
            var eprice = row.find("td:eq(1)").text();
            var bprice = row.find("td:eq(2)").text();
            var fprice = row.find("td:eq(3)").text();
            //var takeoffTime = row.find("td:eq(5)").text();
            var landingTime = row.find("td:eq(7)").text();
            var airline = row.find("td:eq(0)").text();      


            // Check if the row should be hidden based on the filters
            var hideRow =
                (epriceFilter !== "" && parseFloat(eprice) !== parseFloat(epriceFilter)) ||
                (bpriceFilter !== "" && parseFloat(bprice) !== parseFloat(bpriceFilter)) ||
                (fpriceFilter !== "" && parseFloat(fprice) !== parseFloat(fpriceFilter)) ||
                (takeoffFilter !== "") ||
                (landingFilter !== "" && landingTime !== landingFilter) ||
                (airlineFilter !== "" && airline.indexOf(airlineFilter) === -1);

            // Toggle visibility of the row
            row.toggle(!hideRow);
        });
    }
});
