<?php
/* aprés envoie par user du formulaire mail to user pour AR*/
$to      = 'nobody@example.com';
$subject = 'the subject';
$message = 'hello';
$headers = 'From: webmaster@example.com' . "\r\n" .
    

mail($to, $subject, $message, $headers);


?>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>AR</title>
</head>
<body>
<form>
<!--Champ commentaires  -->
<p align="center">
    <legend>Commentaires</legend>
    <textarea name="adress"cols="40" rows="4"></textarea>
</p>

<!-- bouton envoyer   -->
<p align="center">
    <input type="submit" value="Envoyer"/>
</p>
</form>
        <h2 align="center">Je vous remercie pour votre demande.</br>
            Vous allez recevoir un mail accusant reception de votre demande .</br>
            une réponse vous sera prochainement donné.
             </h2>

</body>
</html>
