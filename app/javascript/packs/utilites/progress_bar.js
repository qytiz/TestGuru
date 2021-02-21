document.addEventListener('turbolinks:load',function(){
  const progressBar=document.querySelector('.progress-bar')
  const question=document.querySelector('.question-number')
  if(progressBar)
  {
    const questionNumber= question.dataset.questionNumber
    const totalQuestions= question.dataset.questionsTotal
    let passdiv=document.createElement('div');
    let i= 0;
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