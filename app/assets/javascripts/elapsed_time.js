document.addEventListener('turbolinks:load', function() {
    let d = null;
    let id = null;
    let wait = 10;
    let output = document.getElementById("output");

    let getElapsedTime = function() {
        let dNow = new Date();
        let dElapsed = dNow - d;
        let h = Math.floor(dElapsed / 1000 / 60 / 60);
        let m = Math.floor(dElapsed / 1000 / 60) % 60;
        let s = Math.floor(dElapsed / 1000 ) % 60;
        let ms = dElapsed % 1000;

    let mTxt = ("0" + m).substr(-2);
    let sTxt = ("0" + s).substr(-2);
    let msTxt = ("0" + ms).substr(-2);

    return h + ":" + mTxt + ":" + sTxt + ":" + msTxt;

    };

            d = new Date();
            id = setInterval(function() {
                output.innerHTML = (getElapsedTime());
            }, wait);
    });
