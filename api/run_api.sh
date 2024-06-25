set -e

echo "DIFY_HOME: ${DIFY_HOME}"
echo "API_ENV: ${API_ENV}"

if [ -z "$API_ENV" ]; then
  echo "API_ENV is not set"
  exit 1
fi

if [ -z "$DIFY_HOME" ]; then
  echo "DIFY_HOME is not set"
  exit 1
fi


case "$API_ENV" in "dev"|"test"|"prod")
    echo "running with env: ${API_ENV}"
    ;;
  *)
    echo "API_ENV must be one of [dev, test, prod]"
    exit 1
    ;;
esac

# Copy env to .env

cp ${DIFY_HOME}/config/${API_ENV}/.env .env
echo "copied config/${API_ENV}/env to .env"


flask run --host 0.0.0.0 --port=8071 --debug