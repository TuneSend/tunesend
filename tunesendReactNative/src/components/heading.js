import React, { Component } from 'react';
import {
		Animated,
		Image,
		ScrollView,
		Text,
		View,
		Button
	} from 'react-native';
import Installation from './Installation';
import Instructions from './Instructions';
import KeyboardTest from './KeyboardTest';
import { KeyboardAwareScrollView } from 'react-native-keyboard-aware-scroll-view';
import headerStyles from '../stylesheets/headerStyles';

const HEADER_MAX_HEIGHT = 200;
const HEADER_MIN_HEIGHT = 60;
const HEADER_SCROLL_DISTANCE = HEADER_MAX_HEIGHT - HEADER_MIN_HEIGHT;

class Heading extends Component {

	constructor(props) {
		super(props);

		this.state = {
			scrollY: new Animated.Value(0),
			status: true
		};
	}

	ShowHideTextComponentView = () => {
		if (this.state.status === true) {
			this.setState({ status: false });
		} else {
			this.setState({ status: true });
		}
	}

	renderScrollViewContent() {
		const {
			TextContainer,
		} = headerStyles;

		return (
			<KeyboardAwareScrollView
				style={{ backgroundColor: '#ffffff' }}
				// innerRef={ref => {this.scroll = ref}}
				resetScrollToCoords={{ x: 0, y: 1050 }}
				keyboardShouldPersistTaps='always' // make keyboard not disappear when tapping outside of input
				enableAutoAutomaticScroll={false} // turn off auto scrolling to the field behaviour, which is unfortunately buggy when autocomplete suggestions disappear from the keyboard as displayed in the gif above
			>
				<View style={TextContainer}>
					<Installation />
					<Instructions />
					<KeyboardTest />
				</View>
			</KeyboardAwareScrollView>
			);
  }


	render() {
		const headerHeight = this.state.scrollY.interpolate({
			inputRange: [0, HEADER_SCROLL_DISTANCE],
			outputRange: [HEADER_MAX_HEIGHT, HEADER_MIN_HEIGHT],
			extrapolate: 'clamp',
		});

		const imageOpacity = this.state.scrollY.interpolate({
			inputRange: [0, HEADER_SCROLL_DISTANCE / 2, HEADER_SCROLL_DISTANCE],
      outputRange: [1, 1, 0],
      extrapolate: 'clamp'
		});

		const imageTranslate = this.state.scrollY.interpolate({
			inputRange: [0, HEADER_SCROLL_DISTANCE],
			outputRange: [0, -50],
			extrapolate: 'clamp',
		});

		const {
			fill,
			header,
			ScrollViewContent,
			backgroundImage,
			headerIcon
		} = headerStyles;

    return (
      	<View>
			<ScrollView
				style={ScrollViewContent}
				scrollEventThrottle={5}
				onScroll={
				Animated.event([{ nativeEvent: { contentOffset: { y: this.state.scrollY } } }])}
			>

				{this.state.status ? this.renderScrollViewContent() : null}

			</ScrollView>

			<Animated.View style={[header, { height: headerHeight }]}>
				<Image
					style={headerIcon}
					source={require('../image/TuneSendIcon2.png')}
				/>
				<Animated.Image
					style={[
					backgroundImage,
					{ opacity: imageOpacity, transform: [{ translateY: imageTranslate }] }
					]}
					source={require('../image/TuneSend.png')}
				/>
			</Animated.View>
      	</View>
    );
	}
}


export default Heading;
