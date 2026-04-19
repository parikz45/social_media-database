-- Get all posts with username
SELECT p.id, u.username, p.description, p.created_at
FROM posts p
JOIN users u ON p.user_id = u.id;

-- Get all messages in a conversation with sender name
SELECT m.text, u.username, m.created_at
FROM messages m
JOIN users u ON m.sender_id = u.id
WHERE m.conversation_id = 1;


-- Count posts per user
SELECT u.username, COUNT(p.id) AS total_posts
FROM users u
LEFT JOIN posts p ON u.id = p.user_id
GROUP BY u.username
ORDER BY total_posts DESC;

-- Most active users (by posts)
SELECT user_id, COUNT(*) AS post_count
FROM posts
GROUP BY user_id
ORDER BY post_count DESC
LIMIT 5;


-- Users with most followers
SELECT username, array_length(followers, 1) AS follower_count
FROM users
ORDER BY follower_count DESC;

-- Posts with most likes
SELECT id, array_length(likes, 1) AS like_count
FROM posts
ORDER BY like_count DESC;

-- =========================
-- FILTERING
-- =========================

-- Unread notifications for a user
SELECT * FROM notifications
WHERE receiver_id = 1 AND is_read = FALSE;

-- Messages sent by a specific user
SELECT * FROM messages
WHERE sender_id = 1;


-- Find all replies to a specific message
SELECT * FROM messages
WHERE reply_to = 5;

-- Get latest message per conversation
SELECT DISTINCT ON (conversation_id)
    conversation_id, text, created_at
FROM messages
ORDER BY conversation_id, created_at DESC;

-- Conversations where a user is a member
SELECT *
FROM conversations
WHERE 1 = ANY(members);

-- =========================
-- ANALYTICS
-- =========================

-- Average number of posts per user
SELECT AVG(post_count)
FROM (
    SELECT COUNT(*) AS post_count
    FROM posts
    GROUP BY user_id
) sub;

-- Total messages per conversation
SELECT conversation_id, COUNT(*) AS total_messages
FROM messages
GROUP BY conversation_id
ORDER BY total_messages DESC;

-- Get notifications with sender and receiver usernames
SELECT n.id, s.username AS sender, r.username AS receiver, n.type
FROM notifications n
JOIN users s ON n.sender_id = s.id
JOIN users r ON n.receiver_id = r.id;