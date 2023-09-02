document.addEventListener('DOMContentLoaded', () => {
  const pay = Payjp('pk_test_**************'); 
  const submitBtn = document.getElementById('buy-red-btn');
  submitBtn.addEventListener('click', (e) => {
    e.preventDefault();
    const card = {
      number: document.getElementById('card_number').value,
      exp_month: document.getElementById('exp_month').value,
      exp_year: `20${document.getElementById('exp_year').value}`,
      cvc: document.getElementById('cvc').value,
    };
    Payjp.createToken(card, (status, response) => {
      if (status === 200) {
        const token = response.id;
        const renderDom = document.getElementById('charge-form');
        const tokenObj = `<input value=${token} type='hidden' name='token'>`;
        renderDom.insertAdjacentHTML('beforeend', tokenObj);
      }
      document.getElementById('card_number').removeAttribute('name');
      document.getElementById('exp_month').removeAttribute('name');
      document.getElementById('exp_year').removeAttribute('name');
      document.getElementById('cvc').removeAttribute('name');
      document.getElementById('charge-form').submit();
    });
  });
});