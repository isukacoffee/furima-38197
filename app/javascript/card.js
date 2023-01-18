const pay = () => {
  //環境変数をもとに公開鍵を復号
  const payjp = Payjp(process.env.PAYJP_PUBLIC_KEY); 
  //elementsインスタンスを生成
  const elements = payjp.elements();
  //入力欄ごとにelementインスタンスを生成
  const numberElement = elements.create('cardNumber')
  const cvcElement = elements.create('cardCvc')
  const expiryElement = elements.create('cardExpiry')
  //入力欄をDOM上に表示
  numberElement.mount('#number')
  cvcElement.mount('#cvc') 
  expiryElement.mount('#exp-date')
  //フォームの要素を取得
  const form = document.getElementById("charge-form");
  //PAY.JPと通信が成功した場合のみトークンをフォームに埋め込む
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    payjp.createToken(expiryElement).then((response) => {
      if (response.error) {
      } 
      const token = response.id;
      const renderDom = document.getElementById("charge-form"); 
      const tokenObj = `<input value=${token} name='token' type="hidden"> `;
      renderDom.insertAdjacentHTML("beforeend", tokenObj);
      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);


// PAY.JP V1終了に伴い、V2に変更

// const pay = () => {
//   Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
//   const submit = document.getElementById("button");
//   submit.addEventListener("click", (e) => {
//     e.preventDefault();
   
//     const formResult = document.getElementById("charge-form");
//     const formData = new FormData(formResult);

//     const card = {
//       number: formData.get("purchase_shipping[number]"),
//       cvc: formData.get("purchase_shipping[cvc]"),
//       exp_month: formData.get("purchase_shipping[exp_month]"),
//       exp_year: `20${formData.get("purchase_shipping[exp_year]")}`,
//     };

//     Payjp.createToken(card, (status, response) => {
//       if (status == 200) {
//         const token = response.id;
//         const renderDom = document.getElementById("charge-form");
//         const tokenObj = `<input value=${token} name='token' type="hidden"> `;
//         renderDom.insertAdjacentHTML("beforeend", tokenObj);
//       }

//       document.getElementById("card-number").removeAttribute("name");
//       document.getElementById("card-cvc").removeAttribute("name");
//       document.getElementById("card-exp-month").removeAttribute("name");
//       document.getElementById("card-exp-year").removeAttribute("name");

//       document.getElementById("charge-form").submit();
//     });
//   });
// };


// window.addEventListener("load", pay);