function printDiv(div) {
    let element = document.getElementById(div);
    let domClone = element.cloneNode(true);
    let $printSection = document.createElement("div");
    $printSection.id = "printSection";
    $printSection.appendChild(domClone);
    document.body.insertBefore($printSection, document.body.firstChild);
    window.print();

    let oldElement = document.getElementById('printSection');
    if (oldElement != null) { oldElement.parentNode.removeChild(oldElement);}

    return true;
}