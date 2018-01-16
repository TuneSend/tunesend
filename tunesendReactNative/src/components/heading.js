import React, { Component } from 'react';
import {
      Animated,
      Image,
      ScrollView,
      Text,
      View,
      Button
    } from 'react-native';
import Instructions from './Instructions';

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
		} = styles;

		return (
			<View style={TextContainer}>
				<Instructions />
			</View>
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
			header,
			ScrollViewContent,
			backgroundImage,
			headerIcon
		} = styles;

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
				source={require('../image/TuneSendIcon.png')}
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

const styles = {
	row: {
		height: 40,
		margin: 16,
		backgroundColor: '#D3D3D3',
		alignItems: 'center',
		justifyContent: 'center',
	},
	header: {
		position: 'absolute',
		top: 0,
		left: 0,
		right: 0,
		backgroundColor: '#03A9F4',
		overflow: 'hidden',
	},
	headerIcon: {
		width: 50,
		height: 25,
		alignItems: 'center'
	},
	bar: {
		marginTop: 28,
		height: 32,
		alignItems: 'center',
		justifyContent: 'center',
	},
	title: {
		backgroundColor: 'transparent',
		color: 'white',
		fontSize: 18,
	},
	ScrollViewContent: {
		// marginTop: HEADER_MAX_HEIGHT,
	},
	backgroundImage: {
		position: 'absolute',
		top: 0,
		left: 0,
		right: 0,
		width: null,
		height: HEADER_MAX_HEIGHT,
		resizeMode: 'cover',
	},
	ImageSize: {
		flex: 1,
		width: 250,
		height: 250,
		resizeMode: 'cover',
		alignItems: 'center',
		marginLeft: 50,
	},
	TextContainer: {
		flex: 1,
		alignItems: 'center',
		marginTop: HEADER_MAX_HEIGHT,
	},
	TextFormat: {
		fontSize: 23,
	},
	IconFormat: {
		marginTop: 3,
		marginLeft: 2,
		width: 20,
		height: 20,
	}
};

export default Heading;
