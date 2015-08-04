$(document).ready(function () {
    $('#good').click(function () {
        var request = new PersonModel();

        $.ajax({
            url: "Person/GoodSave",
            dataType: 'json',
            contentType: "application/json",
            type: "POST",
            data: JSON.stringify(request), //Ahhh, much better  http://blog.dontpaniclabs.com/post/2013/02/27/Posting-JSON-Data-to-an-MVC-Controller-via-Ajax
            success: function (response) {
                $("#result").text(response.result);
            }
        });
    });

    $('#bad').click(function () {
        var request = new PersonModel();

        $.ajax({
            url: "Person/BadSave",
            dataType: 'json',
            type: "POST",
            data: "first=" + request.First + "&last=" + request.Last + "&favoriteBands=" + request.FavoriteBands, //How do you encode an array?? This doesn't even work right
            success: function (response) {
                $("#result").text(response.result);
            }
        });
    });
});

function PersonModel() {
    var self = this;
    self.First = $("#First").val();
    self.Last = $("#Last").val();

    self.FavoriteBands = $.map($('#FavoriteBands option:selected'),
                      function (e) { return $(e).val(); });
}