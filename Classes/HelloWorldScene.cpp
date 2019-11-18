/****************************************************************************
 Copyright (c) 2017-2018 Xiamen Yaji Software Co., Ltd.
 
 http://www.cocos2d-x.org
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 ****************************************************************************/

#include "HelloWorldScene.h"
#include "SimpleAudioEngine.h"

USING_NS_CC;

Scene* HelloWorld::createScene()
{
    return HelloWorld::create();
}

// Print useful error message instead of segfaulting when files are not there.
static void problemLoading(const char* filename)
{
    printf("Error while loading: %s\n", filename);
    printf("Depending on how you compiled you might have to add 'Resources/' in front of filenames in HelloWorldScene.cpp\n");
}

// on "init" you need to initialize your instance
bool HelloWorld::init()
{
    //////////////////////////////
    // 1. super init first
    if ( !Scene::init() )
    {
        return false;
    }

    auto visibleSize = Director::getInstance()->getVisibleSize();
    Vec2 origin = Director::getInstance()->getVisibleOrigin();

    /////////////////////////////
    // 2. add a menu item with "X" image, which is clicked to quit the program
    //    you may modify it.

    // add a "close" icon to exit the progress. it's an autorelease object
    auto closeItem = MenuItemImage::create(
                                           "CloseNormal.png",
                                           "CloseSelected.png",
                                           CC_CALLBACK_1(HelloWorld::menuCloseCallback, this));

    if (closeItem == nullptr ||
        closeItem->getContentSize().width <= 0 ||
        closeItem->getContentSize().height <= 0)
    {
        problemLoading("'CloseNormal.png' and 'CloseSelected.png'");
    }
    else
    {
        float x = origin.x + visibleSize.width - closeItem->getContentSize().width/2;
        float y = origin.y + closeItem->getContentSize().height/2;
        closeItem->setPosition(Vec2(x,y));
    }

    // create menu, it's an autorelease object
    auto menu = Menu::create(closeItem, NULL);
    menu->setPosition(Vec2::ZERO);
    this->addChild(menu, 1);

    /////////////////////////////
    // 3. add your codes below...

    // add a label shows "Hello World"
    // create and initialize a label

    auto label = Label::createWithTTF("Hello World", "fonts/Marker Felt.ttf", 24);
    if (label == nullptr)
    {
        problemLoading("'fonts/Marker Felt.ttf'");
    }
    else
    {
        // position the label on the center of the screen
        label->setPosition(Vec2(origin.x + visibleSize.width/2,
                                origin.y + visibleSize.height - label->getContentSize().height));

        // add the label as a child to this layer
        this->addChild(label, 1);
    }

    // add "HelloWorld" splash screen"
    auto sprite = Sprite::create("HelloWorld.png");
    if (sprite == nullptr)
    {
        problemLoading("'HelloWorld.png'");
    }
    else
    {
        // position the sprite on the center of the screen
        sprite->setPosition(Vec2(visibleSize.width/2 + origin.x, visibleSize.height/2 + origin.y));

        // add the sprite as a child to this layer
        //this->addChild(sprite, 0);
    }

	GLenum error;

	m_pProgram = new GLProgram;
	m_pProgram->initWithFilenames("shaders/shader_0tex.vsh", "shaders/shader_0tex.fsh");

	m_pProgram->bindAttribLocation("a_position", GLProgram::VERTEX_ATTRIB_POSITION);
	m_pProgram->bindAttribLocation("a_color", GLProgram::VERTEX_ATTRIB_COLOR);
	//m_pProgram->bindAttribLocation("a_texCoord", GLProgram::VERTEX_ATTRIB_TEX_COORD);

	m_pProgram->link();

	m_pProgram->updateUniforms();

	//uniform_sampler = glGetUniformLocation(m_pProgram->getProgram(), "sampler");
	uniform_wvp_matrix = glGetUniformLocation(m_pProgram->getProgram(), "u_wvp_matrix");

	m_pTexture = Director::getInstance()->getTextureCache()->addImage("texture.jpg");

	// 背景色の指定
	Director::getInstance()->setClearColor(Color4F(0, 1, 0, 0));

	counter = 0;

    return true;
}

void HelloWorld::draw(Renderer* renderer, const Mat4& transform, uint32_t flags)
{
	//GL::enableVertexAttribs(GL::VERTEX_ATTRIB_FLAG_POSITION | GL::VERTEX_ATTRIB_FLAG_COLOR | GL::VERTEX_ATTRIB_FLAG_TEX_COORD);
	GL::enableVertexAttribs(GL::VERTEX_ATTRIB_FLAG_POSITION | GL::VERTEX_ATTRIB_FLAG_COLOR);

	m_pProgram->use();

	counter++;

	Vec3 pos[6];
	Vec4 color[6];
	Vec2 uv[6];
	Mat4 matWVP;

	glVertexAttribPointer(GLProgram::VERTEX_ATTRIB_POSITION, 3, GL_FLOAT, GL_FALSE, 0, pos);
	glVertexAttribPointer(GLProgram::VERTEX_ATTRIB_COLOR, 4, GL_FLOAT, GL_FALSE, 0, color);

	//color[0] = Vec3(0, 0, 0); // 黒
	//color[1] = Vec3(1, 0, 0); // 赤
	//color[2] = Vec3(0, 1, 0); // 緑
	//color[3] = Vec3(0, 0, 1); // 青

	float red = 1.0f;
	float green = 0.0f;
	float blue = 0.0f;

	color[0] = Vec4(1, 0, 0, 1); 
	color[1] = Vec4(1, 0, 0, 1);
	color[2] = Vec4(1, 0, 0, 1);
	color[3] = Vec4(1, 0, 0, 1);
	color[4] = Vec4(1, 0, 0, 1);
	color[5] = Vec4(1, 0, 0, 1);

	uv[0] = Vec2(0, 1);
	uv[1] = Vec2(0, 0);
	uv[2] = Vec2(1, 1);
	uv[3] = Vec2(0, 0);
	uv[4] = Vec2(1, 1);
	uv[5] = Vec2(1, 0);

		//glVertexAttribPointer(GLProgram::VERTEX_ATTRIB_TEX_COORD, 2, GL_FLOAT, GL_FALSE, 0, uv);
	
	// ワールドビュープロジェクション行列の生成
	static float yaw = 0.0f;
	// ラジアン
	//yaw += 0.01f;
	//yaw += CC_RADIANS_TO_DEGREES(1.0f);
	// 120frmで一回転
	yaw += CC_DEGREES_TO_RADIANS(3.0f);
	Mat4 matProjection;
	Mat4 matView;
	
	// ゲームワールドの中心からみた座標系に変換
	Mat4 matWorld = Mat4::IDENTITY;
	// ２Ｄの座標系に変換
	matProjection = _director->getMatrix(MATRIX_STACK_TYPE::MATRIX_STACK_PROJECTION);
	// カメラから見た座標系に変換
	matView = _director->getMatrix(MATRIX_STACK_TYPE::MATRIX_STACK_MODELVIEW);

	// スケーリング行列
	Mat4 matScale;
	// 120frmで周期が一周
	float scale = CC_DEGREES_TO_RADIANS(3.0f * counter);
	// 引数をラジアンとしてサイン関数（6.28ぐらいで一周期）
	scale = sinf(scale) + 2.0f;
	Mat4::createScale(scale, scale, scale, &matScale);
	// 回転行列
	Mat4 matRot;
	Mat4 matRotX, matRotY, matRotZ;
	// 各軸周りの回転行列を計算し、最後に合成
	Mat4::createRotationZ(0, &matRotZ);
	Mat4::createRotationX(0, &matRotX);
	Mat4::createRotationY(yaw, &matRotY);
	matRot = matRotY * matRotX * matRotZ;
	// 平行行列
	Mat4 matTrans;
	Mat4::createTranslation(Vec3(1280.0f/2, 720.0f/2, 0.0f), &matTrans);
	// ワールド行列を合成
	matWorld = matTrans * matRot * matScale;

	matWVP = matProjection * matView * matWorld;

	// 右向きを表すベクトル
	Vec3 v1(1, 0, 0);
	matWorld.transformVector(&v1);

	//glUniform1i(uniform_sampler, 0);
	//GL::bindTexture2D(m_pTexture->getName());

	glUniformMatrix4fv(uniform_wvp_matrix, 1, GL_FALSE, matWVP.m);

	const float x = 50.0f;
	const float y = 50.0f;
	const float z = 50.0f;

	//////// １枚めの描画
	// 三角形１つめ
	pos[0] = Vec3(-x, -y, z);
	pos[1] = Vec3(-x, y, z);
	pos[2] = Vec3(x, -y, z);
	// 三角形２つめ	
	pos[3] = Vec3(-x, y, z);
	pos[4] = Vec3(x, -y, z);
	pos[5] = Vec3(x, y, z);

	//            図形         先頭番号　頂点数
	glDrawArrays(GL_TRIANGLES, 0, 6);

	//////// ２枚めの描画
	// 三角形１つめ
	pos[0] = Vec3(-x, -y, -z);
	pos[1] = Vec3(-x, y,  -z);
	pos[2] = Vec3(x, -y,  -z);
	// 三角形２つめ
	pos[3] = Vec3(-x, y,  -z);
	pos[4] = Vec3(x, -y,  -z);
	pos[5] = Vec3(x, y,   -z);

	//            図形         先頭番号　頂点数
	glDrawArrays(GL_TRIANGLES, 0, 6);
}


void HelloWorld::menuCloseCallback(Ref* pSender)
{
    //Close the cocos2d-x game scene and quit the application
    Director::getInstance()->end();

    /*To navigate back to native iOS screen(if present) without quitting the application  ,do not use Director::getInstance()->end() as given above,instead trigger a custom event created in RootViewController.mm as below*/

    //EventCustom customEndEvent("game_scene_close_event");
    //_eventDispatcher->dispatchEvent(&customEndEvent);


}
