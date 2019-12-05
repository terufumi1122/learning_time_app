document.addEventListener('turbolinks:load', function() {

    let now = new Date();
    let hour = now.getHours();
    let min = now.getMinutes();
    let sec = now.getSeconds();

    let current_time = (hour + ":" + min + ":" + sec);

    document.getElementById("current_time").innerHTML = current_time;

});
