$(document).on('turbolinks:load', function () {

    let row_count = 1;
    $('#add_row').click(function () {

        let new_row = `
        <tr class="item-row">
             <td>
                <input id="product_${row_count+1}" type="text" name="product"  placeholder="Enter Product Name" 
                class="form-control blueprint">
             </td>
             <td>
                <input id="qty_${row_count+1}" type="number" name="qty" placeholder="Enter Qty" 
                class="form-control blueprint qty" step="0" min="0">
            </td>   
            <td>
                <input id="price_${row_count+1}" type="number" name="price" placeholder="Enter Unit Price" 
                class="form-control blueprint price" step="0.00" min="0">
            </td>
            <td>
                <input id="total_${row_count+1}" type="number" name="total" placeholder="0.00" 
                class="form-control blueprint total" readonly="">
            </td>
            <td class="align-middle">
                <a class="btn btn-sm btn-warning delete delete_row">Delete row</a>
            </td>
      </tr>`

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

