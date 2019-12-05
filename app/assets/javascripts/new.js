$(function(){
  $('#price_calc').on('input', function(){   //リアルタイムで表示したいのでinputを使う｡入力の度にイベントが発火するようになる｡
    var data = $('#price_calc').val(); // val()でフォームのvalueを取得(数値)
    console.log(data);
    // if ((data &gt;= 300) &amp;&amp; (data &lt;= 9999999))  {
    var profit = Math.round(data * 0.9)  // 手数料計算を行う｡dataにかけているのが0.9なのは単に引きたい手数料が10%のため｡
    var fee = (data - profit) // 入力した数値から計算結果(profit)を引く｡それが手数料となる｡
    $('.price__right__middle__right').html(fee) //  手数料の表示｡html()は追加ではなく､上書き｡入力値が変わる度に表示も変わるようにする｡
    $('.price__right__middle__right').prepend('¥') // 手数料の前に¥マークを付けたいので
    $('.price__right__bottom__right').html(profit)
    $('.price__right__bottom__right').prepend('¥')
    $('#price').val(data) // 計算結果を格納用フォームに追加｡もし､入力値を追加したいのなら､今回はdataを引数に持たせる｡
    // }
    if (data == '') {   // もし､計算結果が''なら表示も消す｡
    console.log(999);
    $('.price__right__bottom__right').html('');
    $('.price__right__middle__right').html('');
    }
  })
})
