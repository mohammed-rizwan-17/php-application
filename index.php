<!DOCTYPE html>
<html>
<head>
    <title>Bitcot PHP form</title>
</head>
<body>
    <h1>Bitcot PHP form</h1>

    <?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $name = $_POST['name'];
        $email = $_POST['email'];

        // Database connection settings
        $host = 'prod-php-app-db.czv5zhjj9how.ap-south-1.rds.amazonaws.com';
        $user = 'admin';
        $password = '9ZIeTGPaatGFdlQsbIuk';
        $database = 'php';

        // Create a connection to the MySQL database
        $conn = new mysqli($host, $user, $password, $database);

        // Check the connection
        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }

        // Insert data into a MySQL table
        $sql = "INSERT INTO users (name, email) VALUES ('$name', '$email')";

        if ($conn->query($sql) === TRUE) {
            echo "Data successfully added to the database.";
        } else {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }

        $conn->close();
    }
    ?>

    <form method="post" action="<?php echo $_SERVER['PHP_SELF']; ?>">
        <label for="name">Name:</label>
        <input type="text" name="name" id="name" required><br><br>

        <label for="email">Email:</label>
        <input type="email" name="email" id="email" required><br><br>

        <input type="submit" value="Submit">
    </form>
</body>
</html>
