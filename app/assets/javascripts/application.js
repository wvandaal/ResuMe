// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require_tree .

VANDAALEN = {

  common: {
    init: function() {
      //Hide headers, footers, and .content and then transitions them in
      $('header').css("display", "none");
      $('header').show('slide', {direction: 'up'}, 300, stickyNav);
      $('.site-footer').css("display", "none");
      $('.site-footer').show('slide', {direction: 'down'}, 300);
      $(".content, .errors").css("display", "none");
      $(".content, .errors").fadeIn(400);

      //Sticky profile navbar on scroll
      function stickyNav () {
        var $navbar = $('.profile-navbar');
        if ($navbar.length) {
          var objDistance = $navbar.offset().top + 40;
          $(window).scroll(function() {
              var myDistance = $(window).scrollTop();
              if (myDistance > objDistance){
                  $navbar.addClass('navbar-fixed-top');
              }
              if (objDistance > myDistance){
                  $navbar.removeClass('navbar-fixed-top');
              }
          });
        }
      };

      //Fades .content out and retracts headers and footers
      $("a:not([href='#']):not(.no-trans)").on("click", function(event){
          event.preventDefault();
          linkLocation = this.href;
          $(".content, .errors, .tabbed-link, .form-container").fadeOut(200);
          $(".site-footer").hide('slide', {
            direction: 'down',
            complete: function () { window.location = linkLocation; }
          }, 300);
          $("header").hide('slide', {
            direction: 'up',
            complete: function () { window.location = linkLocation; }
          }, 300);
      });

      //button.close-container logic
      $('button.close-container').on('click',function () {
        $(this).parent().css('top', '-100%');
        $('.errors').css('display', 'none')
      });

      //Button to delete items from lists
      $(".delete-button").on("click", function (event) {
        event.preventDefault();
        var content = $(".content");
        var form = $(event.currentTarget).parent();
        $.ajax({
          type: "DELETE",
          url: form[0].action
        }).done(function (data) {
          content.html(data);
        });
      });

    }
  },

  users: {
    init: function() {

    },

    index: function() {

    },

    show: function() {
      // var sizeMultiplier = Math.min($(window).height(), $(window).width());
      // $('.small-bubble').css('width', (.2 * sizeMultiplier) + 'px');
      // $('.small-bubble').css('height', (.2 * sizeMultiplier) + 'px');
    }

  },

  sessions: {
    init: function () {

    },

    new: function () {
      //Slide in
      $(".content").css("display", "none");
      $(".content").show('slide', {direction: 'up'}, 500);
    }
  },

  degrees: {

    init: function () {

    },

    index: function () {
      var formContainer = $('.form-container');
      var windowHeight = $(window).height();

       $(".edit-degree").on("click", function (event) {
        event.preventDefault();
        var degree = $(event.currentTarget).parent().first();
        $.get(event.currentTarget.pathname, function (data) {
          var dataForm = $(data).find('.content')
          formContainer.find('.form').html(dataForm.html());
          formContainer.css('margin-left', formContainer.find('form').first().width()/-2 + 'px');
          formContainer.css('margin-top', ((formContainer.find('form').first().height() - 80)/-2) + 'px');
          formContainer.css('top', (.5 * windowHeight) + 'px');

          var form = $('#degree-form');
          form.on("ajax:success", function (event, data) {
            if ($(data)[0].className == "errors") {
              $('.errors').replaceWith(data);
            } else {
              degree.replaceWith(data);
              formContainer.css('top', '-100%');
            }
          });
        });
      });
    }

  },

  positions: {
    init: function () {

    },

    index: function () {
      var formContainer = $('.form-container');
      var windowHeight = $(window).height();

      $(".edit-position").on("click", function (event) {
        event.preventDefault();
        var badge = $(event.currentTarget).parents().find(".position-badge").first();
        $.get(event.currentTarget.pathname, function (data) {
          formContainer.find('.form').html($(data).find('.content').html());
          var form = formContainer.find('form').first()
          formContainer.css('margin-left', form.width()/-2 + 'px');
          formContainer.css('margin-top', form.height()/-2 + 'px');
          formContainer.css('top', (.5 * windowHeight) + 'px');

          var form = $('#position-form');
          form.on("ajax:success", function (event, data) {
            if ($(data)[0].className == "errors") {
              $('.errors').replaceWith(data);
            } else {
              badge.replaceWith(data);
              formContainer.css('top', '-100%');
            }
          });
        });
      });


      var nestedFormHeight = $('#company-form').height();
      $('.tabbed-link').on("click", function (event) {
        event.preventDefault();
        $.get(event.currentTarget.pathname, function(data) {
          formContainer.find('.form').html($(data).find('.content').html());
          var form = formContainer.find('form').first()
          formContainer.css('margin-left', form.width()/-2 + 'px');
          formContainer.css('margin-top', (form.height() + nestedFormHeight)/-2 + 'px');
          formContainer.css('top', (.5 * windowHeight) + 'px');

          var form = $('#position-form');
          var content = $('.content');
          form.on("ajax:success", function (event, data) {
            if ($(data)[0].className == "errors") {
              $('.errors').replaceWith(data);
            } else {
              content.html(data);
              formContainer.css('top', '-100%');
            }
          });
        });
      });
    }
  },

  projects: {
    init: function () {

    },

    index: function () {
      var formContainer = $('.form-container');
      var windowHeight = $(window).height();
      $('.tabbed-link').on("click", function (event) {
        event.preventDefault();
        $.get(event.currentTarget.pathname, function(data) {
          formContainer.find('.form').html($(data).find('.content').html());
          var form = formContainer.find('form').first()
          formContainer.css('margin-left', form.width()/-2 + 'px');
          formContainer.css('margin-top', form.height()/-2 + 'px');
          formContainer.css('top', (.5 * windowHeight) + 'px');

          var form = $('#project-form');
          form.on("ajax:success", function (event, data) {
            if ($(data)[0].className == "errors") {
              $('.errors').replaceWith(data);
            } else {
              $('.content').append(data);
              formContainer.css("top", "-100%");
            }
          });
        });
      });

      $('.edit-project').on("click", function (event) {
        event.preventDefault();
        var badge = $(event.currentTarget).parents().find(".project-badge").first();
        $.get(event.currentTarget.pathname, function(data) {
          formContainer.find('.form').html($(data).find('.content').html());
          var form = formContainer.find('form').first()
          formContainer.css('margin-left', form.width()/-2 + 'px');
          formContainer.css('margin-top', form.height()/-2 + 'px');
          formContainer.css('top', (.5 * windowHeight) + 'px');

          var form = $('#project-form');
          form.on("ajax:success", function (event, data) {
            if ($(data)[0].className == "errors") {
              $('.errors').replaceWith(data);
            } else {
              badge.replaceWith(data);
              formContainer.css("top", "-100%");
            }
          });
        });
      });

      $('.new-file').on("click", function (event) {
        event.preventDefault();
        var path = event.currentTarget.pathname + event.currentTarget.search;
        $.get(path, function (data) {
          formContainer.find('.form').html($(data).find('.content').html());
          var form = formContainer.find('form').first()
          var badge = $('')
          formContainer.css('margin-left', form.width()/-2 + 'px');
          formContainer.css('margin-top', form.height()/-2 + 'px');
          formContainer.css('top', (.5 * windowHeight) + 'px');

          var form = $('#file-form');
          form.on("ajax:success", function (event, data) {
            if ($(data)[0].className == "errors") {
              $('.errors').replaceWith(data);
            } else {
              badge.replaceWith(data);
              formContainer.css("top", "-100%");
            }
          });
        });
      });

      $('body').on("click", '.view-file', function (event) {
        event.preventDefault();
        $.get(event.currentTarget.pathname, function (data) {
          formContainer.find('.form').html($(data).find('.content').html());
          var form = formContainer.find('.form').first()
          form.find('pre').first().css('height', .5 * windowHeight + "px")
          formContainer.css('margin-left', form.width()/-2 + 'px');
          formContainer.css('margin-top', form.height()/-2 + 'px');
          formContainer.css('top', (.5 * windowHeight) + 'px');
        });
      });
    }
  },

  files: {
    init: function () {

    }
  },

  schools: {
    init: function () {

    },

    index: function () {
      var formContainer = $('.form-container');
      var windowHeight = $(window).height();

      $(".edit-school-badge").on("click", function (event) {
        event.preventDefault();
        var anchor = $(event.currentTarget);
        $.get(event.currentTarget.pathname, function (data) {
          formContainer.find('.form').html($(data).find('.content').html());
          var form = formContainer.find('form').first()
          formContainer.css('margin-left', form.width()/-2 + 'px');
          formContainer.css('margin-top', form.height()/-2 + 'px');
          formContainer.css('top', (.5 * windowHeight) + 'px');

          var form = $('#school-form');
          form.on("ajax:success", function (event, data) {
            if ($(data)[0].className == "errors") {
              $('.errors').replaceWith(data);
            } else {
              anchor.html(data);
              formContainer.css('top', '-100%');
            }
          });
        });
      });

      $('.tabbed-link').on("click", function (event) {
        event.preventDefault();
        $.get(event.currentTarget.pathname, function(data) {
          formContainer.find('.form').html($(data).find('.content').html());
          var form = formContainer.find('form').first()
          formContainer.css('margin-left', form.width()/-2 + 'px');
          formContainer.css('margin-top', form.height()/-2 + 'px');
          formContainer.css('top', (.5 * windowHeight) + 'px');

          var form = $('#school-form');
          var lastRow = $('.row').last()
          form.on("ajax:success", function (event, data) {
            if ($(data)[0].className == "errors") {
              $('.errors').replaceWith(data);
            } else {
              console.log(data);       
              if (lastRow.children().length > 1) {
                $('.content').append("<div class='row clearfix'>" + data + "</div>");
              } else {
                lastRow.append(data);
              }
              formContainer.css('top', '-100%');
            }
          });
        });
      });
    }
  }
};

UTIL = {
  exec: function(controller, action) {
    var ns = VANDAALEN,
        action = (action === undefined) ? "init" : action;

    if (controller !== "" && ns[controller] &&
      typeof ns[controller][action] == "function") {
        ns[controller][action]();
      }
  },

  init: function() {
    var body = document.body,
        controller = body.getAttribute("data-controller"),
        action = body.getAttribute("data-action");

    UTIL.exec("common");
    UTIL.exec(controller);
    UTIL.exec(controller, action);
  }
};

$(document).ready(UTIL.init);
