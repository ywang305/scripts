aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 145742810091.dkr.ecr.us-east-1.amazonaws.com  &&



export HOST_IP=$(ifconfig | grep -E "([0-9]{1,3}\.){3}[0-9]{1,3}" | grep -v 127.0.0.1 | awk '{ print $2 }' | cut -f2 -d: | head -n1)

export TAG1=$(aws ecr describe-images --repository-name orders-management-api --query 'sort_by(imageDetails,& imagePushedAt)[-1].imageTags[0]'  | tr -d '"')
echo $TAG1

export TAG2=$(aws ecr describe-images --repository-name exchange-orders-match-engine --query 'sort_by(imageDetails,& imagePushedAt)[-1].imageTags[0]'  | tr -d '"')
echo $TAG2

export TAG3=$(aws ecr describe-images --repository-name exchange-market --query 'sort_by(imageDetails,& imagePushedAt)[-1].imageTags[0]'  | tr -d '"')
echo $TAG3  # retrieve latest image and remove the "



docker-compose down &&

docker-compose up -d
