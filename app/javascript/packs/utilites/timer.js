document.addEventListener('turbolinks:load', () => {
  let timer=document.querySelector('.timer')
  if (timer){
    change_time(timer.innerHTML)
  }
})

function change_time(timer){
  if (timer>0)
    setTimeout(function(){change_time(timer)}, 1000);
  else
    document.querySelector('input[type="submit"]').click()
  console.log(timer)
  document.querySelector('.timer').innerHTML=timer--
}