<?php 
include 'db.php';

// Include Composer's autoloader
require 'vendor/autoload.php';

// Now you can use PHPMailer
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

$mail = new PHPMailer(true);

if (isset($_GET['request_no'])) {
    $request_no = $_GET['request_no'];

    // Get current status
    $stmt = $conn->prepare("SELECT status FROM evaluation_requests WHERE request_no = ?");
    $stmt->bind_param("s", $request_no);
    $stmt->execute();
    $stmt->bind_result($current_status);
    $stmt->fetch();
    $stmt->close();

    $new_status = ($current_status === 'active') ? 'inactive' : 'active';

    // Update the status
    $update = $conn->prepare("UPDATE evaluation_requests SET status = ? WHERE request_no = ?");
    $update->bind_param("ss", $new_status, $request_no);
    $update->execute();
    $update->close();

    // If the status is now active, send email to panelists
    if ($new_status === 'active') {
        // Get the email of panelists (role 3) from the users table
        $panelists_query = "SELECT email FROM users WHERE role = 3";
        $panelists_result = $conn->query($panelists_query);
        
        if ($panelists_result->num_rows > 0) {
            // Send email to each panelist
            while ($row = $panelists_result->fetch_assoc()) {
                $email = $row['email'];

                try {
                    // Server settings
                    $mail->isSMTP();
                    $mail->Host       = 'smtp.gmail.com';
                    $mail->SMTPAuth   = true;
                    $mail->Username   = 'eddiemarkbryandoverte@gmail.com'; // Your Gmail address
                    $mail->Password   = 'uucx sptd lggg nnvl'; // Your app password
                    $mail->SMTPSecure = 'tls';
                    $mail->Port       = 587;

                    // Recipients
                    $mail->setFrom('eddiemarkbryandoverte@gmail.com', 'DOST Shelf-life Evaluation');
                    $mail->addAddress($email); // Add panelist email

                    // Content

                    $mail->isHTML(true);
                    $mail->Subject = 'Sensory Evaluation Request Activated';
                    $mail->Body    = 'Dear Panelist,<br><br>The sensory evaluation request you are assigned to has been activated. Please proceed with your task.<br><br>Best regards,<br>Analyst Team';

                    $mail->send();
                } catch (Exception $e) {
                    echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
                }
            }
        }
    }
}

header("Location: analyst.php");
exit();
?>
