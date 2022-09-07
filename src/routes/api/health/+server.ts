import { json, type RequestHandler } from '@sveltejs/kit';

export const GET: RequestHandler = () => {
	return json({
		status: 200,
		body: {
			status: 'OK'
		}
	});
};
