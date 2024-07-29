<?php
require 'config/database.php';

// make sure edit post button was clicked
if (isset($_POST['submit'])) {
    $id = filter_var($_POST['id'], FILTER_SANITIZE_NUMBER_INT);
    $previous_thumbnail_name = filter_var($_POST['previous_thumbnail_name'], FILTER_SANITIZE_FULL_SPECIAL_CHARS);
    $title = filter_var($_POST['title'], FILTER_SANITIZE_FULL_SPECIAL_CHARS);
    $body = filter_var($_POST['body'], FILTER_SANITIZE_SPECIAL_CHARS);
    $category_id = filter_var($_POST['category'], FILTER_SANITIZE_NUMBER_INT);
    $is_featured = filter_var($_POST['is_featured'], FILTER_SANITIZE_NUMBER_INT);
    $thumbnail = $_FILES['thumbnail'];

    // set is_featured to 0 if it was unchecked
    $is_featured = $is_featured == 1 ?: 0;

    // check and validate input values
    if (!$title || !$category_id || !$body) {
        $_SESSION['edit-post'] = "Couldn't update post. Invalid form data on edit post page.";
    } else {
        // delete existing thumbnail if new thumbnail is available
        if ($thumbnail['name']) {
            $previous_thumbnail_path = '../images/' . $previous_thumbnail_name;
            if ($previous_thumbnail_path && file_exists($previous_thumbnail_path)) {
                unlink($previous_thumbnail_path);
            }

            // work on new thumbnail
            // rename image
            $time = time(); // make each image name upload unique current timestamp
            $thumbnail_name = $time . $thumbnail['name'];
            $thumbnail_tmp_name = $thumbnail['tmp_name'];
            $thumbnail_destination_path = '../images/' . $thumbnail_name;

            // make sure file is an image
            $allowed_files = ['png', 'jpg', 'jpeg'];
            $extension = strtolower(pathinfo($thumbnail_name, PATHINFO_EXTENSION));
            if (in_array($extension, $allowed_files)) {
                // make sure avatar is not too large (20mb+)
                if ($thumbnail['size'] < 20000000) {
                    // upload avatar
                    move_uploaded_file($thumbnail_tmp_name, $thumbnail_destination_path);
                } else {
                    $_SESSION['edit-post'] = "Couldn't update post. Thumbnail size too big. Should be less than 20mb";
                }
            } else {
                $_SESSION['edit-post'] = "Couldn't update post. Thumbnail should be png, jpg or jpeg";
            }
        }
    }

    if (isset($_SESSION['edit-post']) && $_SESSION['edit-post']) {
        // redirect to manage form page if form was invalid
        header('location: ' . ROOT_URL . 'admin');
        die();
    } else {
        // set is_featured of all posts to 0 if is_featured for this post is 1
        if ($is_featured == 1) {
            $zero_all_featured_query = "UPDATE posts SET is_featured=0";
            mysqli_query($connection, $zero_all_featured_query);
        }

        // set thumbnail name if a new one was uploaded, else keep old thumbnail name
        $thumbnail_to_insert = $thumbnail_name ?? $previous_thumbnail_name;

        $query = "UPDATE posts SET title=?, body=?, thumbnail=?, category_id=?, is_featured=? WHERE id=? LIMIT 1";
        $stmt = mysqli_prepare($connection, $query);
        mysqli_stmt_bind_param($stmt, "sssiii", $title, $body, $thumbnail_to_insert, $category_id, $is_featured, $id);
        mysqli_stmt_execute($stmt);

        if (!mysqli_stmt_errno($stmt)) {
            $_SESSION['edit-post-success'] = "Post updated successfully";
        }
        mysqli_stmt_close($stmt);
    }
}

header('location: ' . ROOT_URL . 'admin/index.php');
die();
?>