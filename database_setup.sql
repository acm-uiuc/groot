CREATE DATABASE IF NOT EXISTS groot_caffeine_service_dev;
CREATE DATABASE IF NOT EXISTS groot_credits_service;
CREATE DATABASE IF NOT EXISTS groot_meme_service;
CREATE DATABASE IF NOT EXISTS groot_merch_service_dev;
CREATE DATABASE IF NOT EXISTS groot_quote_service_dev;
CREATE DATABASE IF NOT EXISTS groot_recruiter_service_dev;
CREATE DATABASE IF NOT EXISTS groot_user_service_dev;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';
FLUSH PRIVILEGES;