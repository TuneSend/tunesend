import { StyleSheet } from 'react-native';

const HEADER_MAX_HEIGHT = 200;

const headerStyles = StyleSheet.create({
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
        marginTop: 21,
        marginLeft: 15,
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
});

export default headerStyles;
