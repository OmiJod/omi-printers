PrinterBox = {}

$(document).ready(function() {
    window.addEventListener('message', function(event) {
        var action = event.data.action;

        switch (action) {
            case "openprinternui":
                PrinterBox.Open(event.data);
                break;
            case "startprinternui":
                PrinterBox.Start(event.data);
                break;
            case "close":
                PrinterBox.Close(event.data);
                break;
        }
    });
});

$(document).ready(function() {
    $('.printerbox-accept').click(function() {
        PrinterBox.Save();
        PrinterBox.Close();
    });
    $('.printerbox-decline').click(function() {
        PrinterBox.Close();
    });
});

$(document).on('keydown', function() {
    switch (event.keyCode) {
        case 27: // ESC
            PrinterBox.Close();
            break;
        case 9: // ESC
            PrinterBox.Close();
            break;
    }
});

PrinterBox.Open = function(data) {
    if (data.url) {
        $(".paper-container").fadeIn(150);
        $(".document-image").attr('src', data.url);
    } else {
        console.log('No document is linked to it!!!!!')
    }
}

PrinterBox.Start = function(data) {
    $(".printerbox-container").fadeIn(150);
}

PrinterBox.Save = function(data) {
    $.post('https://qb-printer/SaveDocument', JSON.stringify({
        url: $('.printerboxurl-input').val()
    }));
}

PrinterBox.Close = function(data) {
    $(".printerbox-container").fadeOut(150);
    $(".paper-container").fadeOut(150);
    $.post('https://qb-printer/CloseDocument');
}