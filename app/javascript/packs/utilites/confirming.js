document.addEventListener('turbolinks:load', () => {
    var confirm_field = document.querySelector('#user_password_confirmation')
    if (confirm_field == null) return
    else
        confirm_field.addEventListener('change', (e) => {
            var wrongConfirmation = e.target.parentNode.querySelector(".octicon-alert")
            var matchConfirmation = e.target.parentNode.querySelector(".octicon-check")
            var confirm = e.target.value
            if (!confirm) {
                matchConfirmation.classList.add('hide')
                wrongConfirmation.classList.add('hide')
            }
            var password = document.querySelector('#user_password').value
            if (confirm == password) {
                matchConfirmation.classList.remove('hide')
                wrongConfirmation.classList.add('hide')
            }
            else {
                matchConfirmation.classList.add('hide')
                wrongConfirmation.classList.remove('hide')
            }
        })
}) 