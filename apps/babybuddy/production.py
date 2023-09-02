from .base import *

# Production settings
# See babybuddy.settings.base for additional settings information.

SECRET_KEY = os.getenv("SECRET_KEY")

ALLOWED_HOSTS = ["*"]

# Database
# https://docs.djangoproject.com/en/4.0/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': os.getenv("DB_NAME"),
        'USER': os.getenv("DB_USER"),
        'PASSWORD': os.getenv("DB_PASS"),
        'HOST': os.getenv("DB_HOST"),
        'PORT': os.getenv("DB_PORT", default = "5432"),
    }
}

# Media files
# https://docs.djangoproject.com/en/4.0/topics/files/

MEDIA_ROOT = os.path.join(BASE_DIR, "../data/media")

# Security
# After setting up SSL, uncomment the settings below for enhanced security of
# application cookies.
#
# See https://docs.djangoproject.com/en/4.0/topics/http/sessions/#settings
# See https://docs.djangoproject.com/en/4.0/ref/csrf/#settings

# SESSION_COOKIE_SECURE = True
# CSRF_COOKIE_SECURE = True