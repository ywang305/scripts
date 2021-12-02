#!/usr/bin/env zx

// @ts-nocheck
await $`aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 145742810091.dkr.ecr.us-east-1.amazonaws.com`;

async function getLatestTag(img_name) {
  const resstr = await $`aws ecr describe-images --repository-name ${img_name}`;
  const { imageDetails } = JSON.parse(resstr);
  return imageDetails.sort((a, b) => b.imagePushedAt - a.imagePushedAt)?.[0]
    .imageTags[0];
}

const REPO_SEQUENCE = ["sbweb3j", "hd-key-manager", "blockchain_service"];

for (let i = 0; i < REPO_SEQUENCE.length; ++i) {
  const img = REPO_SEQUENCE[i];
  const devTag = await getLatestTag(img);
  process.env[`TAG${i + 1}`] = devTag;
}

await $`docker-compose down`;
await $`docker-compose up -d`;
