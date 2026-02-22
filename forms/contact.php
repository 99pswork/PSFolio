<?php
  $receiving_email_address = '99ps.work@gmail.com';

  if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(403);
    die('Forbidden');
  }

  $name = isset($_POST['name']) ? strip_tags(trim($_POST['name'])) : '';
  $email = isset($_POST['email']) ? filter_var(trim($_POST['email']), FILTER_SANITIZE_EMAIL) : '';
  $subject = isset($_POST['subject']) ? strip_tags(trim($_POST['subject'])) : '';
  $message = isset($_POST['message']) ? strip_tags(trim($_POST['message'])) : '';

  if (empty($name) || empty($subject) || empty($message)) {
    die('Please fill in all required fields.');
  }

  if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    die('Please enter a valid email address.');
  }

  $email_subject = "Contact Form: $subject";

  $email_body = "You have received a new message from your website contact form.\n\n";
  $email_body .= "Name: $name\n";
  $email_body .= "Email: $email\n";
  $email_body .= "Subject: $subject\n\n";
  $email_body .= "Message:\n$message\n";

  $headers = "From: $name <$email>\r\n";
  $headers .= "Reply-To: $email\r\n";
  $headers .= "X-Mailer: PHP/" . phpversion();

  if (mail($receiving_email_address, $email_subject, $email_body, $headers)) {
    echo 'OK';
  } else {
    die('Unable to send email. Please try again later or contact directly at ' . $receiving_email_address);
  }
?>
