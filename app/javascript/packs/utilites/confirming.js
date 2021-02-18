document.addEventListener('turbolinks:load', () => {
    let confirm_field = document.querySelector('#user_password_confirmation')
    if (confirm_field == null) return
    else{
        let wrongConfirmation = document.querySelector(".octicon-alert")
        let matchConfirmation = document.querySelector(".octicon-check")
        confirm_field.addEventListener('change', event => {
            let confirm = event.target.value
            if (!confirm) {
            }
            let password = document.querySelector('#user_password').value
            if (confirm == password) {
                matchConfirmation.classList.remove('hide')
                wrongConfirmation.classList.add('hide')
            }
            else {
                matchConfirmation.classList.add('hide')
                wrongConfirmation.classList.remove('hide')
            }
        })
    }
}) 