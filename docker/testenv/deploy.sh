aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 145742810091.dkr.ecr.us-east-1.amazonaws.com  &&



export HOST_IP=$(ifconfig | grep -E "([0-9]{1,3}\.){3}[0-9]{1,3}" | grep -v 127.0.0.1 | awk '{ print $2 }' | cut -f2 -d: | head -n1)

export TAG_EX_MGR_API=$(aws ecr describe-images --repository-name orders-management-api --query 'sort_by(imageDetails,& imagePushedAt)[-1].imageTags[0]'  | tr -d '"')
echo $TAG_EX_MGR_API

export TAG_EX_MATCH=$(aws ecr describe-images --repository-name exchange-orders-match-engine --query 'sort_by(imageDetails,& imagePushedAt)[-1].imageTags[0]'  | tr -d '"')
echo $TAG_EX_MATCH

export TAG_EX_MKT=$(aws ecr describe-images --repository-name exchange-market --query 'sort_by(imageDetails,& imagePushedAt)[-1].imageTags[0]'  | tr -d '"')
echo $TAG_EX_MKT  # retrieve latest image and remove the "

export TAG_EX_ORDER_API=$(aws ecr describe-images --repository-name exchange-orders-api --query 'sort_by(imageDetails,& imagePushedAt)[-1].imageTags[0]'  | tr -d '"')
echo $TAG_EX_ORDER_API

export TAG_TRADING_VUE=$(aws ecr describe-images --repository-name trading-vue --query 'sort_by(imageDetails,& imagePushedAt)[-1].imageTags[0]'  | tr -d '"')
echo $TAG_TRADING_VUE

export TAG_ADMIN_WEB=$(aws ecr describe-images --repository-name admin-web --query 'sort_by(imageDetails,& imagePushedAt)[-1].imageTags[0]'  | tr -d '"')
echo $TAG_ADMIN_WEB

export TAG_ADMIN_BACKEND=$(aws ecr describe-images --repository-name admin-backend --query 'sort_by(imageDetails,& imagePushedAt)[-1].imageTags[0]'  | tr -d '"')
echo $TAG_ADMIN_BACKEND

export TAG_UCENTER=$(aws ecr describe-images --repository-name ucenter --query 'sort_by(imageDetails,& imagePushedAt)[-1].imageTags[0]'  | tr -d '"')
echo $TAG_UCENTER

export TAG_OAUTH_CENTER=$(aws ecr describe-images --repository-name oauth-center --query 'sort_by(imageDetails,& imagePushedAt)[-1].imageTags[0]'  | tr -d '"')
echo $TAG_OAUTH_CENTER



docker-compose down &&

docker-compose up -d