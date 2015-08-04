function split(val) {
    return val.split(/,\s*/);
}

function extractLast(term) {
    return split(term).pop();
}


function htmlEncode(value) {
    if (value) {
        return jQuery('<div />').text(value).html();
    } else {
        return '';
    }
}

function htmlDecode(value) {
    if (value) {
        return $('<div />').html(value).text();
    } else {
        return '';
    }
}

function convertToBinary(string) {
    var PADDING = "00000000";
    var resultArray = [];
    for (var i = 0; i < string.length; i++) {
        var compact = string.charCodeAt(i).toString(2);
        var padded = compact.substring(0, PADDING.length - compact.length) + compact;
        resultArray.push(padded);
    }
    return resultArray.join(" ");
}


function autoCompleteCategoryAndCompany(id, type) {

    $("#" + id).autocomplete({
        source: function (request, response) {

            var text = $("#" + id).val();
            var substr = split(text);
            text = substr[substr.length - 1];

            if (text == '') {
                return;
            }

            //var ajaxUrl = '@Url.Action("CategoriesAutofill", "Ajax")';
            // ajaxUrl = window.rootUrl + "/Ajax/CategoriesAutofill";
            var ajaxUrl = "/Ajax/CategoriesAutofill";
            
            $.ajax({
                url: ajaxUrl,
                dataType: "json",
                data: {
                    featureClass: "P",
                    style: "full",
                    maxRows: 12,
                    name_startsWith: request.term,
                    typeId: type,
                    text: text,
                },
                error: function (xhtmlRequest, status, error) {
                    console.error('Error ' + status + ' ' + xhtmlRequest.responseText);
                },
                success: function (data) {
                    var i = $.map(data, function (item) {
                        return {
                            label: item.CategoryName,
                            value: item.CategoryName
                        };
                    });
                    response(i);

                }
            });


        },
        minLength: 2,
        select: function (event, ui) {
            return false;

        },
        focus: function (event, ui) {

            var terms = split(this.value);
            // remove the current input
            terms.pop();
            // add the selected item
            terms.push(ui.item.value);
            // add placeholder to get the comma-and-space at the end
            terms.push("");

            this.value = terms.join(", ");
            return false;
        },
        open: function () {
            $(this).removeClass("ui-corner-all").addClass("ui-corner-top");
        },
        close: function () {
            $(this).removeClass("ui-corner-top").addClass("ui-corner-all");
        }
    });


}
function editStoryRequest(contentUrlId) {

    var jsonRequest = JSON.stringify({ "contentUrlId": contentUrlId });
    jQuery.ajax({
        //url: '@Url.Action("EditContentUrlStory", "Ajax")',
        url:  "/Ajax/EditContentUrlStory",
        type: 'POST',
        data: jsonRequest,
        dataType: 'json',
        contentType: 'application/json; charset=utf-8',
        success: function (data) {
            //console.log("editStoryRequest");
            displayContentUrl(data, contentUrlId);
        },
        error: function (request, status, error) {
           console.error('Error ' + status + ' ' + request.responseText);
        },
        beforeSend: function () {

        }
    });
    return false;
}

function displayContentUrl(data, id) {
    var items = data;
    var result = '';
    $.each(items, function (i, item) {
        result += item;
    });

    try {
        var m = $("#content_" + id);
        m.empty();
        m.append(result);
        m.show('slow');
    } catch (err) {
        //Handle errors here
        console.error(err.message);
    }
    $("#editButton_" + id).show('slow');
    $("#HidebuttonDown_" + id).show('slow');
    $("#HidebuttonUp_" + id).show('slow');

    //var ajaxUrl = '@Url.Action("CategoriesAutofill", "Ajax")';
    var textBoxIdCat = "Categories_" + id;
    if ($("#" + textBoxIdCat).length > 0) {
        autoCompleteCategoryAndCompany(textBoxIdCat, 1);
    }


    var textBoxIdCom = "Companies_" + id;
    if ($("#" + textBoxIdCom).length > 0) {
        autoCompleteCategoryAndCompany(textBoxIdCom, 2);
        console.log("1212");
        
        var textBoxIdTitle = "Title_" + id;
        if ($("#" + textBoxIdTitle).length > 0) {
            var content = $("#" + textBoxIdTitle).val();
            var textBoxIdBody = "Body_" + id;
            content += " " + $("#" + textBoxIdBody).val();
            //content = htmlDecode(content);

            getCompaniesNameFromContentUrlData(textBoxIdCom, content);
        }

    } else {
        
    }
}
function getCompaniesNameFromContentUrlData(textBoxId, content) {
   
    var d = JSON.stringify({ "content": content });
    jQuery.ajax({
        url: "/Ajax/GetContentUrlCompanies",
        type: 'POST',
        data: d,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            if ($("#" + textBoxId).val().length == 0) {
                $("#" + textBoxId).val(data);
            }
            //console.log(data);
        },
        error: function (request, status, error) {
            $("#debug").html('Error ' + status + ' ' + request.responseText);
        },
        beforeSend: function () {

        }
    });
    return false;
}
function gatherFormValuesAndUpdate(storyId, isPublished, successStoryStatusFunction) {

    var id = storyId;

    var m = $('.jq-story-edit-wrap_' + id);
    var items = m.find('.jq-value-story');
    var hashtable = {};

    items.each(function () {
        var name = $(this).attr("id");
        var value = "";
        var type = $(this).attr("type");
        if (type == 'checkbox') {
            value = $(this).is(':checked');
        } else if (type == 'text') {
            value = htmlEncode($(this).val());
        } else if (type == 'hidden') {
            value = $(this).val();
        } else {
            value = $(this).val();
        }
        hashtable[name] = value;
    });
    if (isPublished) {
        hashtable["IsPublished"] = true;
    }
    var storyImages = m.find('.jq-story-images-checkbox');
    var images = "";
    storyImages.each(function () {
        var id = $(this).attr("id").replace("Image_", "");
        var value = $(this).is(':checked');
        images += id + "=" + value + ",";
    });
    hashtable["Images"] = images;

    var storyAreas = m.find('.jq-story-area-checkbox');
    var areas = "";
    storyAreas.each(function () {
        var id = $(this).attr("id").replace("Area_", "");
        var value = $(this).is(':checked');
        areas += id + "=" + value + ",";
    });
    hashtable["Areas"] = areas;

    var jsonResult = JSON.stringify(hashtable);
    var contentUrlId = parseInt(hashtable["ContentUrlId"]);
    //console.log(jsonResult);
    UpdateStory(jsonResult, contentUrlId, successStoryStatusFunction);
    return false;
}
function UpdateStory(jsonRequest, contentUrlId, successStoryStatusFunction) {

    var d = JSON.stringify({ "jsonRequest": jsonRequest });
    jQuery.ajax({
        //url: '@Url.Action("UpdateStory", "Ajax")',
        url: "/Ajax/UpdateStory",
        type: 'POST',
        data: d,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            changeStoryStatus(contentUrlId, 2, successStoryStatusFunction);
        },
        error: function (request, status, error) {
            $("#debug").html('Error ' + status + ' ' + request.responseText);
        },
        beforeSend: function () {

        }
    });
    return false;
}
function changeStoryStatus(id, statusId, successFunction) {

    var jsonRequest = JSON.stringify({ "contentUrlId": id, "StatusId": statusId });
    successFunction.arguments = jsonRequest;
    jQuery.ajax({
        //url: '@Url.Action("ChangeContentUrlStatus", "Ajax")',
        url: "/Ajax/ChangeContentUrlStatus",
        type: 'POST',
        data: jsonRequest,
        dataType: 'json',
        contentType: 'application/json; charset=utf-8',
        success: successFunction,
        error: function (request, status, error) {
            $("#debug").html('Error ' + status + ' ' + request.responseText);
        },
        beforeSend: function () {

        }
    });
    return false;
}