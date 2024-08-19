docker compose down
docker image build --no-cache base_image/ -t almost/base
docker image build --no-cache jupyter/ -t almost/jupyter
docker compose up --build -d