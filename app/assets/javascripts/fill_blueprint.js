$(document).on('turbolinks:load', function () {

    $('body').on('click', '#invoice_blueprint', function () {
        create_product_rows();

        // Input data values from form to modal
        $('.blueprint').each(function () {
            bind($('#' + this.id), $("#" + this.id + "_print"));
        });

        // Add currency to fields
        $('.with_currency').each(function () {
            let currency = $('#invoice_currency').val();
            $(this).append(" " + currency);
        })


    })
});

function create_product_rows() {
    let rows = $('.item-row').length;
    $('#print_body').empty();


    for (let i = 0; i < rows; i++) {
        let new_row = `
            <tr>
                <td class="center">${i + 1}</td>
                <td id="product_${i + 1}_print" class="left strong"></td>
                <td id="qty_${i + 1}_print" class="right"> </td>
                <td id="price_${i + 1}_print" class="center with_currency"> </td>
                <td class="right"> </td>
                <td id="total_${i + 1}_print" class="center with_currency"> </td>
            </tr>`;
        $('#print_body').append(new_row);
    }


}


function bind(form, blueprint) {
    let val = form.val();
    blueprint.empty();
    blueprint.append(val);
}