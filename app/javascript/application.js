// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"


$(document).on('turbo:load', function () {
  $('.keyup').keyup(function () {
    $(this).val($(this).val().toUpperCase());
  });

  $('.real').mask('#.##0,00', { reverse: true });

  $('.letra_sistema').mask('Z', {
    translation: {
      'Z': {
        pattern: /[a-zA-Z]/, optional: false
      }
    }
  });

  $('.data').mask('00/00/0000');
  $('.cpf').mask('000.000.000-00');

  // $('.select2').select2({ theme: "bootstrap-5" });


  // setTimeout(function () {
  //   $('.alert').alert('close');
  // }, 4000); // 4 segundos em milissegundos

  $(document).on("click", "[data-confirm-delete]", function (event) {
    event.preventDefault();
    var link = $(this).attr("data-confirm-delete");
    var csrfToken = $(this).attr("data-csrf-token");

    Swal.fire({
      title: 'Tem certeza?',
      text: "Você não poderá reverter!",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: 'var(--bs-primary)',
      cancelButtonColor: 'var(--bs-danger)',
      confirmButtonText: 'Sim, tenho certeza!',
      cancelButtonText: 'Cancelar'
    }).then((result) => {
      if (result.isConfirmed) {
        var form = $('#' + $(this).closest('form').attr('id'));

        var methodInput = $('<input type="hidden" name="_method" value="delete">');
        var csrfInput = $('<input type="hidden" name="authenticity_token" value="' + csrfToken + '">');

        form.attr('action', link);
        form.append(methodInput);
        form.append(csrfInput);
        form.submit();
      }
    });
  });
});

