$(document).on('turbolinks:load', function () {

    let row_count = 1;
    $('#add_row').click(function () {
        $('.item-row:last').after(new_row);
        row_count++;
    });


    $('body').on('click', '.delete_row', function () {
        if (row_count > 1) {
            $(this).parents('.item-row').remove();
            row_count--;
        }
        calc();
    });

    $('#tab_logic tbody').on('keyup change', function () {
        calc();
    });
    $('#tax').on('keyup change', function () {
        calc_total();
    });

    let new_row = '<tr class=\'item-row\'>\n' +
        '            <td><input type="text" name=\'product\' placeholder=\'Enter Product Name\' class="form-control "/></td>\n' +
        '            <td><input type="number" name=\'qty\' placeholder=\'Enter Qty\' class="form-control qty" step="0" min="0"/>\n' +
        '            </td>\n' +
        '            <td>\n' +
        '              <input type="number" name=\'price\' placeholder=\'Enter Unit Price\' class="form-control price" step="0.00" min="0"/>\n' +
        '            </td>\n' +
        '            <td><input type="number" name=\'total\' placeholder=\'0.00\' class="form-control total" readonly/></td>\n' +
        '            <td class="align-middle"><a class="delete_row btn btn-sm btn-warning delete">Delete row</a></td>\n' +
        '          </tr>';


});

function calc() {
    $('#tab_logic tbody tr').each(function () {
        let qty = $(this).find('.qty').val();
        let price = $(this).find('.price').val();
        $(this).find('.total').val(qty * price);

        calc_total();
    });
}

function calc_total() {
    let total = 0;
    $('.total').each(function () {
        total += parseInt($(this).val());
    });
    $('#sub_total').val(total.toFixed(2));
    tax_sum = total / 100 * $('#tax').val();
    $('#tax_amount').val(tax_sum.toFixed(2));
    $('#invoice_amount').val((tax_sum + total).toFixed(2));
}

