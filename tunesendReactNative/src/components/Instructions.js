import React, { Component } from 'react';
import { View, Animated, Keyboard, Text, Image, Switch, Font, TextInput } from 'react-native';
import Video from 'react-native-video';

let VIDEO_HEIGHT = 320;
let VIDEO_HEIGHT_SMALL = 240;

class Instructions extends Component {
		constructor(props) {
			super(props);
		
			this.state = {
				isToggled: false,
				isReady: false
			};
			this.keyboardHeight = new Animated.Value(0);
			this.imageHeight = new Animated.Value(VIDEO_HEIGHT);
		}

		componentWillMount() {
			(async() => {
				await Font.loadAsync({
					Pacifico: { uri: 'https://fonts.googleapis.com/css?family=Pacifico" rel="stylesheet' }
			});

				this.setState({ isReady: true });
			})();

			this.keyboardWillShowSub = Keyboard.addListener('keyboardWillShow', this.keyboardWillShow);
			this.keyboardWillHideSub = Keyboard.addListener('keyboardWillHide', this.keyboardWillHide);
		}

		componentWillUnmount() {
			this.keyboardWillShowSub.remove();
			this.keyboardWillHideSub.remove();
		}

		keyboardWillShow = (event) => {
			Animated.parallel([
				Animated.timing(this.keyboardHeight, {
					duration: event.duration,
					toValue: event.endCoordinates.height,
				}),
				Animated.timing(this.imageHeight, {
					duration: event.duration,
					toValue: VIDEO_HEIGHT_SMALL,
				}),
			]).start();
		};

		keyboardWillHide = (event) => {
			Animated.parallel([
				Animated.timing(this.keyboardHeight, {
					duration: event.duration,
					toValue: 0,
				}),
				Animated.timing(this.imageHeight, {
					duration: event.duration,
					toValue: VIDEO_HEIGHT,
				}),
			]).start();
		};

		render() {
			const {
				// ScrollViewContent,
				TextContainer,
				TextView,
				TextFormat,
				IconFormat,
				gifFormat,
				inputContainerStyle,
				inputStyle
			} = styles;

			return (

				<Animated.View
					style={[TextContainer, { paddingBottom: this.keyboardHeight }]}
				>
						<Video
							style={{ ...gifFormat, marginTop: 70, height: this.imageHeight }}
							source={{ uri: './settings.mp4' }}
							ref={(ref) => {
								console.log('this', this.player);
								this.player = ref;
							}}                            // Store reference
							rate={1.0}                    // 0 is paused, 1 is normal.
							paused={false}                // Pauses playback entirely.
							resizeMode="cover"            // Fill the whole screen at aspect ratio.*
							repeat={true}               // Repeat forever.
							onLoadStart={this.loadStart}  // Callback when video starts to load
							onLoad={this.setDuration}     // Callback when video loads
							onEnd={this.onEnd}            // Callback when playback finishes
							onError={this.videoError}     // Callback when video cannot be loaded
						/>
						<Animated.View style={TextView}>
							<Animated.Text style={TextFormat}>
							Open
							</Animated.Text>
							<Animated.Text
								style={{
									...TextFormat,
									color: '#55b2f9',
									paddingLeft: 6
								}}
							>
								Sett
							</Animated.Text>
							<Animated.Text
								style={{
									...TextFormat,
									color: '#f6be5f',
								}}
							>
								ings
							</Animated.Text>
							<Animated.Image style={IconFormat} source={require('../image/settingsIconIOS.png')} />
						</Animated.View>
						<Video
							style={{ ...gifFormat, height: this.imageHeight }}
							source={{ uri: './TuneSend.mp4' }}
							ref={(ref) => {
								console.log('this', this.player);
								this.player = ref;
							}}                            // Store reference
							rate={1.0}                    // 0 is paused, 1 is normal.
							paused={false}                // Pauses playback entirely.
							resizeMode="cover"            // Fill the whole screen at aspect ratio.*
							repeat={true}               // Repeat forever.
							playWhenInactive={false}    // [iOS] Video continues to play when control or notification center are shown.
							onLoadStart={this.loadStart}  // Callback when video starts to load
							onLoad={this.setDuration}     // Callback when video loads
							onEnd={this.onEnd}            // Callback when playback finishes
							onError={this.videoError}     // Callback when video cannot be loaded
						/>
					<Animated.View style={TextView}>
						<Animated.Text style={TextFormat} behavior="padding">
							Scroll down to
						</Animated.Text>
						<Animated.Text
							style={{
								...TextFormat,
								color: '#55b2f9',
								paddingLeft: 6
							}}
						>
							Tune
						</Animated.Text>
						<Animated.Text
							style={{
								...TextFormat,
								color: '#f6be5f',
								paddingRight: 5
							}}
						>
							Send
						</Animated.Text>
						<Animated.Image style={{ ...IconFormat, marginLeft: 8 }} source={require('../image/TuneSendIconBlack.png')} />
					</Animated.View>
					<Video
						style={{ ...gifFormat, height: this.imageHeight }}
						source={{ uri: './keyboards.mp4' }}
						ref={(ref) => {
							console.log('this', this.player);
							this.player = ref;
						}}                            // Store reference
						rate={1.0}                    // 0 is paused, 1 is normal.
						paused={false}                // Pauses playback entirely.
						resizeMode="cover"            // Fill the whole screen at aspect ratio.*
						repeat={true}               // Repeat forever.
						playWhenInactive={false}    // [iOS] Video continues to play when control or
						//notification center are shown.
						onLoadStart={this.loadStart}  // Callback when video starts to load
						onLoad={this.setDuration}     // Callback when video loads
						onEnd={this.onEnd}            // Callback when playback finishes
						onError={this.videoError}     // Callback when video cannot be loaded
					/>
					<Animated.View style={TextView}>
						<Animated.Text style={TextFormat}>
							Click on
							</Animated.Text>
							<Animated.Text
								style={{
									...TextFormat,
									color: '#55b2f9',
									paddingLeft: 6
								}}
							>
								key
							</Animated.Text>
							<Animated.Text
								style={{
									...TextFormat,
									color: '#f6be5f',
								}}
							>
								boards
							</Animated.Text>
						<Animated.Image style={{ ...IconFormat, marginLeft: 5 }} source={require('../image/keyboardsIconIOS.png')} />
					</Animated.View>
					<Video
						style={{ ...gifFormat, height: this.imageHeight }}
						source={{ uri: './switchOn.mp4' }}
						ref={(ref) => {
							console.log('this', this.player);
							this.player = ref;
						}}                            // Store reference
						rate={1.0}                    // 0 is paused, 1 is normal.
						paused={false}                // Pauses playback entirely.
						resizeMode="cover"            // Fill the whole screen at aspect ratio.*
						repeat={true}               // Repeat forever.
						playWhenInactive={false}    // [iOS] Video continues to play when control or
						//notification center are shown.
						onLoadStart={this.loadStart}  // Callback when video starts to load
						onLoad={this.setDuration}     // Callback when video loads
						onEnd={this.onEnd}            // Callback when playback finishes
						onError={this.videoError}     // Callback when video cannot be loaded
					/>
					<Animated.View style={TextView}>
							<Animated.Text style={TextFormat}>
								Enable
							</Animated.Text>
							<Animated.Text
								style={{
									...TextFormat,
									color: '#55b2f9',
									paddingLeft: 6
								}}
							>
								Tune
							</Animated.Text>
							<Animated.Text
								style={{
									...TextFormat,
									color: '#f6be5f',
									paddingRight: 5
								}}
							>
								Send
							</Animated.Text>
						<Switch
							style={{ ...IconFormat, marginTop: 18, marginLeft: 3 }}
							value={this.state.isToggled}
							onValueChange={(newValue) => this.setState({ isToggled: newValue })}
						/>
					</Animated.View>
					<Animated.View style={inputContainerStyle}>
						<Animated.TextInput
							style={inputStyle}

						/>
					</Animated.View>
					<Animated.View style={{ height: 200 }} />
			</Animated.View>
			);
	}
}


const styles = {
	TextContainer: {
			flex: 1,
			alignItems: 'center',
			marginTop: 0,
			paddingBottom: this.keyboardHeight
	},
	TextView: {
		flexDirection: 'row',
	},
	TextFormat: {
		marginTop: 10,
		fontSize: 24,
		marginBottom: 25,
		fontFamily: 'Pacifico',
	},
	IconFormat: {
		marginTop: 12,
		marginLeft: 10,
		width: 40,
		height: 40,
	},
	gifFormat: {
		flexWrap: 'wrap',
		flexDirection: 'column',
		marginTop: 70,
		marginBottom: 4,
		borderWidth: 1,
		width: 240,
		height: VIDEO_HEIGHT,
	},
	inputContainerStyle: {
		borderRadius: 20,
		borderWidth: 1,
		borderColor: 'grey',
		width: 340,
		height: 40,
		marginBottom: 40
	},
	inputStyle: {
		height: 40,
		fontSize: 22,
		paddingLeft: 10
	}
};

export default Instructions;
