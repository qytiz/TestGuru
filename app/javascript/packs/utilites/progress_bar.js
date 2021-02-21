document.addEventListener('turbolinks:load',function(){
  let progressBar=document.querySelector('.progress-bar')
  let question=document.querySelector('.question-number')
  if(progressBar)
  {
    let questionNumber= question.dataset.questionNumber
    let totalQuestions= question.dataset.questionsTotal
    let passdiv=document.createElement('div');
    let i=0;
    let passWidth = 0
    passdiv.className= 'passed';
    do{
      passWidth+=parseInt(getComputedStyle(progressBar).width)/totalQuestions
      console.log(i)
      i++;
    } while(i<=questionNumber-1)
    passdiv.style.width=passWidth+'px'
    progressBar.append(passdiv)
  }
})