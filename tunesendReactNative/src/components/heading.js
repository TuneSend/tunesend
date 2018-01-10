import React from 'react';
import {
      Animated,
      Image,
      ScrollView,
      AppRegistry,
      StyleSheet,
      Text,
      View,
      Button
    } from 'react-native';

const HEADER_MAX_HEIGHT = 200;
const HEADER_MIN_HEIGHT = 60;
const HEADER_SCROLL_DISTANCE = HEADER_MAX_HEIGHT - HEADER_MIN_HEIGHT;

export default class Heading extends React.Component {

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
		return (
			<View style={styles.ScrollViewContent}>
				{/*<Image style={styles.ImageSize} source={require('../image/test/number1.jpg')} />*/}
				<Text>
					Open Settings
				</Text>
				{/*<Image style={styles.ImageSize} source={require('../image/test/number2.jpg')} />*/}
				<Text>
					Scroll down to TuneSend
				</Text>
				{/*<Image style={styles.ImageSize} source={require('../image/test/number3.jpg')} />*/}
				<Text>
					Click on keyboards
				</Text>
				<Text>
					Toggle switch on
				</Text>
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

    return (
      <View style={styles.fill}>
          <ScrollView
            style={styles.fill}
            scrollEventThrottle={5}
            onScroll={
              Animated.event([{ nativeEvent: { contentOffset: { y: this.state.scrollY } } }])}
          >

			{this.state.status ? this.renderScrollViewContent() : null}

			<Button title="Placeholder" onPress={this.ShowHideTextComponentView} />
          </ScrollView>

          <Animated.View style={[styles.header, { height: headerHeight }]}>
            <Image source={require('../image/icon.png')} />
          <Animated.Image
            style={[
              styles.backgroundImage,
              { opacity: imageOpacity, transform: [{ translateY: imageTranslate }] }
            ]}
            source={require('../image/TuneSend.png')}
          />
        </Animated.View>
      </View>
    );
	}
}

const styles = StyleSheet.create({
	fill: {
		flex: 1,
	},
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
		marginTop: HEADER_MAX_HEIGHT,
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
	TextFormat: {
		
	}

});

AppRegistry.registerComponent('Heading', () => Heading);
