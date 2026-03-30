%dw 2.0
output text/plain
var user = payload
---
"
<html>
<head>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f9f9f9;
        color: #333;
        line-height: 1.6;
        padding: 20px;
    }
    header p {
        font-size: 1.2em;
        font-weight: bold;
    }
    h2 {
        color: #2c3e50;
        margin-bottom: 5px;
    }
    article {
        background-color: #fff;
        padding: 15px;
        margin-bottom: 20px;
        border-radius: 8px;
        box-shadow: 0px 2px 6px rgba(0,0,0,0.1);
    }
    img {
        max-width: 200px;
        border-radius: 5px;
        margin-bottom: 10px;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 10px;
    }
    table, th, td {
        border: 1px solid #ddd;
    }
    td, th {
        padding: 8px;
        text-align: left;
    }
    tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    a {
        color: #3498db;
        text-decoration: none;
        font-weight: bold;
    }
</style>
</head>
<body>

<header>
<p>Bonjour $(user.subscriber.firstname) $(user.subscriber.lastname) !</p>
</header>

<p>Nous savons que vous aimez les genres $(user.subscriber.genres joinBy ", ")</p>

<p>Alors ces nouveaux films vont vous interesser cette semaine:</p>

<div>
$(
    (user.releases map (data) -> 
"
<article>
<div>
    <img src='$(data.movie.image)'/>
    <h2>$(data.movie.name)</h2>
    <p><b>Réalisateur :</b> $(data.movie.director)</p>
    <p><b>Date :</b> $(data.movie.date)</p>
    <p><b>Genres :</b> $(data.movie.genres joinBy ", ")</p>
    <p>$(data.movie.description)</p>
    <a href='$(data.movie.trailer)'>Voir la bande annonce</a>
</div>
<table>
$(
    data.schedules pluck ((times, day) ->
        "<tr><td>" ++ day ++ "</td><td>" ++ (times joinBy ", ") ++ "</td></tr>"
    ) joinBy ""
)
</table>
</article>
"
) joinBy ""
)
</div>

</body>
</html>
"